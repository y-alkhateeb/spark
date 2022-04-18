import 'package:dio/dio.dart';

import '../../env/config_reader.dart';

class DioBaseOption {
  BaseOptions get options => BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 15000,
    sendTimeout: 10000,
    responseType: ResponseType.json,
    baseUrl: ConfigReader.getBaseUrl(),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
}