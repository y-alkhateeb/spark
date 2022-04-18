import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../constants/app/app_constants.dart';
import '../datasource/isp_helper.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    if (await GetIt.I<ISpHelper>().hasToken) {
      final apiToken = GetIt.I<ISpHelper>().authToken;
      options.headers[ApplicationConstants.HEADER_AUTH] = '$apiToken';
    }
    return super.onRequest(options, handler);
  }
}
