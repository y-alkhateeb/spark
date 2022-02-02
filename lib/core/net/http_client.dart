import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:spark/core/errors/connection_error.dart';
import 'package:spark/core/navigation/home_navigation_service.dart';
import 'package:spark/generated/l10n.dart';
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
import 'api_url.dart';
import '../constants/enums/http_method.dart';
import 'package:http_parser/http_parser.dart';

import 'interceptor.dart';


class HttpClient{
  static late Dio _client;

  Dio get instance => _client;

  HttpClient() {
    BaseOptions _options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      sendTimeout: 10000,
      responseType: ResponseType.json,
      baseUrl: BASE_URL,
    );
    _client = Dio(_options);
    /// For logger
    _client.interceptors.add(PrettyDioLogger());

    /// To add Authentication into header
    /// [authorization] [os] [appversion] [session]
    _client.interceptors.add(AuthInterceptor());
  }



  Future<Either<BaseError, T>> sendRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    required CancelToken cancelToken,
  }) async {
    // Get the response from the server
    Response response;
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await _client.get(
            url,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.POST:
          response = await _client.post(
            url,
            data: body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PUT:
          response = await _client.put(
            url,
            data: body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await _client.delete(
            url,
            data: body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }
      try {
          // Get the decoded json
        return Right(response.data!);

      } on FormatException catch(e) {
        debugPrint(e.toString());
        return Left(FormatError());
      } catch (e) {
        debugPrint(e.toString());
        return Left(UnknownError());
      }
    }
    // Handling errors
    on DioError catch (e) {
      return Left(_handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e) {
      return Left(SocketError());
    }
    on HttpException catch (e){
      return Left(ConnectionError());
    }
  }

  Future<Either<BaseError, T>> upload<T>({
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
        return Right(response.data!);

      } on FormatException catch(e) {
        return Left(FormatError());
      } catch (e) {
        return Left(UnknownError());
      }
    }
    // Handling errors
    on DioError catch (e) {
      return Left(_handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e) {
      return Left(SocketError());
    }
    on HttpException catch (e){
      return Left(ConnectionError());
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
      return CancelError(S.of(HomeNS().context).error_cancel_token);
    } else
      return UnknownError();
    }
  }
}