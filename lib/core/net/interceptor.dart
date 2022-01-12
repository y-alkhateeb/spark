import 'package:dio/dio.dart';
import 'package:spark/core/bloc/app_config/app_config_cubit.dart';
import '../constants/app/app_constants.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (await AppConfigCubit().hasToken) {
      final apiToken = await AppConfigCubit().authToken;
      options.headers[ApplicationConstants.HEADER_AUTH] = '$apiToken';
    }
    return super.onRequest(options, handler);
  }
}
