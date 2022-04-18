// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/helper/firebase_analytics_helper.dart' as _i4;
import '../core/helper/global_notification.dart' as _i5;
import '../core/helper/utilities.dart' as _i7;
import '../core/net/cache/dio_cache_options.dart' as _i3;
import '../core/net/network_info.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DioCacheOptions>(() => _i3.DioCacheOptions());
  gh.lazySingleton<_i4.FirebaseAnalyticsHelper>(
      () => _i4.FirebaseAnalyticsHelper());
  gh.lazySingleton<_i5.GlobalNotification>(() => _i5.GlobalNotification());
  gh.lazySingleton<_i6.NetworkInfoImpl>(() => _i6.NetworkInfoImpl());
  gh.lazySingleton<_i7.Utilities>(() => _i7.Utilities());
  return get;
}
