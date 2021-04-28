import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spark/core/errors/unknown_error.dart';
import 'package:get_it/get_it.dart';
import '../net/interceptor.dart';
import '../net/net.dart';
import '../errors/base_error.dart';
import 'package:http_parser/http_parser.dart';

class RemoteDataSource {
 Future<Either<BaseError, TModel>>requestUploadFile<TModel, TResponse,EModel>({
   required TResponse Function(dynamic) converter,
   required String url,
   required String fileKey,
   required String filePath,
   required MediaType mediaType,
   Map<String, dynamic>? data,
   ProgressCallback? onSendProgress,
   ProgressCallback? onReceiveProgress,
   bool withAuthentication = false,
   bool withTenants = false,
   required CancelToken cancelToken,
 }) async {

   // Specify the headers.
   final Map<String, String> headers = {};
   GetIt.I<HttpClient>().instance.interceptors.clear();
   if (withAuthentication) {
     GetIt.I<HttpClient>().instance.interceptors.add(AuthInterceptor());
   }

   // Send the request.
   final response = await GetIt.I<HttpClient>().upload<TResponse, EModel>(
     url: url,
     fileKey: fileKey,
     filePath: filePath,
     fileName: filePath.substring(filePath.lastIndexOf('/') + 1),
     mediaType: mediaType,
     data: data!,
     headers: headers,
     onSendProgress: onSendProgress!,
     cancelToken: cancelToken,
   );

   // convert jsonResponse to model and return it
   var responseModel;
   if(response.isLeft()){
     return Left((response as Left<BaseError, TResponse>).value);
   }
   else if(response.isRight()){
     responseModel = converter((response as Right<BaseError, TResponse>).value);
     return Right(responseModel);
   }
   return Left(UnknownError());
 }

  /// [TModel] type of model response from server
  /// [TResponse]type of response from dart should be  dynamic map or List<dynamic>
  /// [EModel] type of error message when response status code is 500
  Future<Either<BaseError, TModel>> request<TModel, TResponse,EModel>({
    required TResponse Function(dynamic) converter,
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    bool withAuthentication = false,
    required CancelToken cancelToken,
  }) async {

    // Specify the headers.
    final Map<String, String> headers = {};
    GetIt.I<HttpClient>().instance.interceptors.clear();
    if (withAuthentication) {
      GetIt.I<HttpClient>().instance.interceptors.add(AuthInterceptor());
    }
    // Send the request.
    final response = await GetIt.I<HttpClient>().sendRequest<TResponse,EModel>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters ?? {},
      body: body!,
      cancelToken: cancelToken,
    );
    // convert jsonResponse to model and return it
    var responseModel;
    if(response.isLeft()){
      return Left((response as Left<BaseError, TResponse>).value);
    }
    else if(response.isRight()){
      responseModel = converter((response as Right<BaseError, TResponse>).value);
      return Right(responseModel);
    }
    return Left(UnknownError());
  }
}
