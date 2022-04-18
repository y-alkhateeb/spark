import 'package:tf_dio_cache/dio_http_cache.dart';

import '../../../env/config_reader.dart';

class CacheManager {
  DioCacheManager call() {
    return DioCacheManager(
      CacheConfig(
        baseUrl: ConfigReader.getBaseUrl(),
        defaultRequestMethod: "POST",
      ),
    );
  }
}
