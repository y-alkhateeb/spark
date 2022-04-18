// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/helper/firebase_analytics_helper.dart' as _i4;
import '../core/helper/global_notification.dart' as _i5;
import '../core/helper/utilities.dart' as _i11;
import '../core/net/cache/dio_cache_options.dart' as _i3;
import '../core/net/network_info.dart' as _i10;
import '../feature/account/data/datasources/account_remote.dart' as _i7;
import '../feature/account/data/datasources/iaccount_remote.dart' as _i6;
import '../feature/account/domain/repository/account_repository.dart' as _i9;
import '../feature/account/domain/repository/iaccount_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DioCacheOptions>(() => _i3.DioCacheOptions());
  gh.lazySingleton<_i4.FirebaseAnalyticsHelper>(
      () => _i4.FirebaseAnalyticsHelper());
  gh.lazySingleton<_i5.GlobalNotification>(() => _i5.GlobalNotification());
  gh.factory<_i6.IAccountRemoteSource>(() => _i7.AccountRemoteSource());
  gh.factory<_i8.IAccountRepository>(
      () => _i9.AccountRepository(get<_i6.IAccountRemoteSource>()));
  gh.lazySingleton<_i10.NetworkInfoImpl>(() => _i10.NetworkInfoImpl());
  gh.lazySingleton<_i11.Utilities>(() => _i11.Utilities());
  return get;
}
