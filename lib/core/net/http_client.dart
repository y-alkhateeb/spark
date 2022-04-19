import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:spark/core/errors/connection_error.dart';
import 'package:spark/core/ui/show_error.dart';
import '../common/loading_helper.dart';
import '../errors/bad_request_error.dart';
import '../errors/base_error.dart';
import '../errors/cancel_error.dart';
import '../errors/conflict_error.dart';
import '../errors/forbidden_error.dart';
import '../errors/format_error.dart';
import '../errors/internal_server_error.dart';
import '../errors/not_found_error.dart';
import '../errors/socket_error.dart';
import '../errors/timeout_error.dart';
import '../errors/unauthorized_error.dart';
import '../errors/unknown_error.dart';
import '../result/result.dart';
import '../constants/enums/http_method.dart';
import 'package:http_parser/http_parser.dart';

import 'cache/cache_manager.dart';
import 'cache/dio_cache_options.dart';
import 'interceptor.dart';
import 'network_info.dart';

class HttpClient{
  late Dio _client;

  HttpClient(BaseOptions options) {
    _client = Dio(options);
    /// For logger
    if (kDebugMode) {
      _client.interceptors.add(PrettyDioLogger(requestBody: true));
    }

    /// To add Authentication into header
    /// [authorization] [os] [appversion] [session]
    _client.interceptors.add(AuthInterceptor());
    _client.interceptors.add(CacheManager()().interceptor);
  }

  
  Future<MyResult<T>> request<T>({
    required T Function(dynamic) converter,
    required HttpMethod method,
    required String url,
    bool forceRefresh = false,
    bool isShowDialog = false,
    required CancelToken cancelToken,
    dynamic queryParameters, // may be Map<String, dynamic> or String or int ..
    dynamic body, // may be Map<String, dynamic> or String or int ..
  }) async {
    if(isShowDialog){
      GetIt.I<LoadingHelper>().showLoadingDialog();
    }
    // Get the response from the server
    Response response;
    final connected = await GetIt.I<NetworkInfoImpl>().isConnected;
    if (!connected) {
      if(isShowDialog){
        GetIt.I<LoadingHelper>().dismissDialog();
      }
      ShowError.showErrorSnakBar(ConnectionError());
      return MyResult.isError(ConnectionError());
    }
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await _client.get(
            url,
            queryParameters: queryParameters,
            options: GetIt.I<DioCacheOptions>()(forceRefresh: forceRefresh),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.POST:
          response = await _client.post(
            url,
            data: body,
            queryParameters: queryParameters,
            options: GetIt.I<DioCacheOptions>()(forceRefresh: forceRefresh),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PUT:
          response = await _client.put(
            url,
            data: body,
            queryParameters: queryParameters,
            options: GetIt.I<DioCacheOptions>()(forceRefresh: forceRefresh),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await _client.delete(
            url,
            data: body,
            queryParameters: queryParameters,
            options: GetIt.I<DioCacheOptions>()(forceRefresh: forceRefresh),
            cancelToken: cancelToken,
          );
          break;
      }
      if(isShowDialog){
        GetIt.I<LoadingHelper>().dismissDialog();
      }
      // Use the compute function to run parsePhotos in a separate isolate.
      return MyResult.isSuccess(converter(response.data!));
    }
    // Handling errors
    on DioError catch (e) {
      BaseError error = _handleDioError(e);
      if(isShowDialog){
        GetIt.I<LoadingHelper>().dismissDialog();
      }
      ShowError.showErrorSnakBar(error);
      return MyResult.isError(error);
    }

    // Couldn't reach out the server
    on SocketException catch (e) {
      if(isShowDialog){
        GetIt.I<LoadingHelper>().dismissDialog();
      }
      ShowError.showErrorSnakBar(SocketError());
      return MyResult.isError(SocketError());
    }
    on HttpException catch (e){
      if(isShowDialog){
        GetIt.I<LoadingHelper>().dismissDialog();
      }
      ShowError.showErrorSnakBar(ConnectionError());
      return MyResult.isError(ConnectionError());
    }
  }


  Future<MyResult<T>> upload<T>({
    required String url,
    required String fileKey,
    required String filePath,
    required String fileName,
    required MediaType mediaType,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required CancelToken cancelToken,
  }) async {

    Map<String, dynamic> dataMap = {};
    if (data != null) {
      dataMap.addAll(data);
    }
      dataMap.addAll({
        fileKey: await MultipartFile.fromFile(
          filePath,
          filename: fileName,
          contentType: mediaType,
        )
      });
    try {
      Response<T> response = await _client.post(
        url,
        data: FormData.fromMap(dataMap),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );

      try {
        // Get the decoded json
        return MyResult.isSuccess(response.data!);

      } on FormatException catch(e) {
        return MyResult.isError(FormatError());
      } catch (e) {
        return MyResult.isError(UnknownError());
      }
    }
    // Handling errors
    on DioError catch (e) {
      return MyResult.isError(_handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e) {
      return MyResult.isError(SocketError());
    }
    on HttpException catch (e){
      return MyResult.isError(ConnectionError());
    }
  }

  BaseError _handleDioError<E>(DioError error) {
    if (error.type == DioErrorType.other ||
        error.type == DioErrorType.response) {
      if (error.error is SocketException) return SocketError();
      if (error.type == DioErrorType.response) {
        switch (error.response!.statusCode) {
          case 400:
            return BadRequestError();
          case 401:
            return UnauthorizedError();
          case 403:
            return ForbiddenError();
          case 404:
            return NotFoundError();
          case 409:
            return ConflictError();
          case 500:
                return InternalServerError();
          default:
            return UnknownError();
        }
      }
      return UnknownError();
    } else {
      if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return TimeoutError();
    } else if (error.type == DioErrorType.cancel) {
      return CancelError();
    } else
      return UnknownError();
    }
  }
}