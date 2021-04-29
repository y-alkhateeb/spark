import 'package:dio/dio.dart';
import '../../feature/account/data/repository/account_repository.dart';
import '../constants/app/app_constants.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (await AccountRepository.hasToken) {
      final token = await AccountRepository.authToken;
      if (token.isNotEmpty) {
        options.headers[ApplicationConstants.HEADER_AUTH] = '$token';
        options.headers[ApplicationConstants.HEADER_APP_VERSION] = '$token';
        options.headers[ApplicationConstants.HEADER_OS] = '$token';
        options.headers[ApplicationConstants.HEADER_SESSION] = '$token';
      }
    }
    return super.onRequest(options, handler);
  }
}
