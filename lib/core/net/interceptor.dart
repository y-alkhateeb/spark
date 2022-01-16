import 'package:dio/dio.dart';
import 'package:spark/core/datasource/sp_helper.dart';
import '../constants/app/app_constants.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (await SPHelper.hasToken) {
      final apiToken = await SPHelper.authToken;
      options.headers[ApplicationConstants.HEADER_AUTH] = '$apiToken';
    }
    return super.onRequest(options, handler);
  }
}
