import 'package:dio/dio.dart';
import 'package:spark/core/common/appConfig.dart';
import '../constants/app/app_constants.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (await AppConfig().hasToken) {
      final session = await AppConfig().authToken;
      final os = AppConfig().os;
      final appVersion = AppConfig().appVersion;
      final apiKey = AppConfig().apiKey;
      if (os != null) options.headers[ApplicationConstants.HEADER_OS] = '$os';
      if (appVersion != null) options.headers[ApplicationConstants.HEADER_APP_VERSION] = '$appVersion';
      if (os != null) options.headers[ApplicationConstants.HEADER_SESSION] = '$session';
      options.headers[ApplicationConstants.HEADER_AUTH] = '$apiKey';
    }
    return super.onRequest(options, handler);
  }
}
