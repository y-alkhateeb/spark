// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:spark/core/errors/unknown_error.dart';
// import 'package:get_it/get_it.dart';
// import 'package:spark/core/net/model/base_model.dart';
// import '../net/interceptor.dart';
// import '../net/net.dart';
// import '../errors/base_error.dart';
// import 'package:http_parser/http_parser.dart';
//
// class RemoteDataSource {
//  Future<Either<BaseError, TModel>>requestUploadFile<TModel, TResponse>({
//    required TResponse Function(dynamic) converter,
//    required String url,
//    required String fileKey,
//    required String filePath,
//    required MediaType mediaType,
//    Map<String, dynamic>? data,
//    ProgressCallback? onSendProgress,
//    ProgressCallback? onReceiveProgress,
//    bool withAuthentication = false,
//    bool withTenants = false,
//    required CancelToken cancelToken,
//  }) async {
//
//    // Send the request.
//    final response = await GetIt.I<HttpClient>().upload<TModel>(
//      url: url,
//      fileKey: fileKey,
//      filePath: filePath,
//      fileName: filePath.substring(filePath.lastIndexOf('/') + 1),
//      mediaType: mediaType,
//      data: data,
//      // headers: headers,
//      onSendProgress: onSendProgress,
//      cancelToken: cancelToken,
//    );
//
//    // convert jsonResponse to model and return it
//    var responseModel;
//    if(response.isLeft()){
//      return Left((response as Left<BaseError, TModel>).value);
//    }
//    else if(response.isRight()){
//      responseModel = converter((response as Right<BaseError, TModel>).value);
//      return Right(responseModel);
//    }
//    return Left(UnknownError());
//  }
//
//   /// [TModel] type of model response from server
//   /// [TResponse]type of response from dart should be  dynamic map or List<dynamic>
//   Future<Either<BaseError, TModel>> request<TModel extends BaseModel, TResponse>({
//     required TResponse Function(dynamic) converter,
//     required HttpMethod method,
//     required String url,
//     TModel? model,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? body,
//     bool withAuthentication = false,
//     required CancelToken cancelToken,
//   }) async {
//
//
//     // Send the request.
//     Either<BaseError, dynamic> response = await GetIt.I<HttpClient>().requestMapResponse(
//       method: method,
//       url: url,
//       queryParameters: queryParameters ?? {},
//       body: body,
//       cancelToken: cancelToken,
//     );
//     // convert jsonResponse to model and return it
//     var responseModel;
//     if(response.isLeft()){
//       return Left((response as Left<BaseError, TResponse>).value);
//     }
//     else if(response.isRight()){
//       if((response as Right<BaseError, dynamic>).value is Map){
//         return Right(model!.fromJson((response).value));
//       }
//       else if((response as Right<BaseError, dynamic>).value is List){
//         return Right((response).value.map((e)=>model!.fromJson(e)).toList().cast<TModel>());
//       }
//       // responseModel = converter((response as Right<BaseError, TResponse>).value);
//       return Right(responseModel);
//     }
//     return Left(UnknownError());
//   }
// }
