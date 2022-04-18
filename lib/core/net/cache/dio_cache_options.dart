import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

@lazySingleton
class DioCacheOptions{

  Options call({bool forceRefresh = true}) {
    return buildCacheOptions(
      const Duration(hours: 3),
      maxStale: const Duration(days: 7),
      forceRefresh: forceRefresh,
      options: Options(extra: {}),
    );
  }

}