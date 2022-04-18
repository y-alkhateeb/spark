// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../core/datasource/isp_helper.dart' as _i12;
import '../core/datasource/sp_helper.dart' as _i13;
import '../core/helper/firebase_analytics_helper.dart' as _i5;
import '../core/helper/global_notification.dart' as _i6;
import '../core/helper/utilities.dart' as _i17;
import '../core/navigation/base_route.gr.dart' as _i3;
import '../core/net/cache/dio_cache_options.dart' as _i4;
import '../core/net/net.dart' as _i7;
import '../core/net/network_info.dart' as _i15;
import '../feature/account/data/datasources/account_remote.dart' as _i9;
import '../feature/account/data/datasources/iaccount_remote.dart' as _i8;
import '../feature/account/domain/repository/account_repository.dart' as _i11;
import '../feature/account/domain/repository/iaccount_repository.dart' as _i10;
import 'injection_module.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.singleton<_i3.AppRouter>(injectionModule.appRouter);
  gh.lazySingleton<_i4.DioCacheOptions>(() => _i4.DioCacheOptions());
  gh.lazySingleton<_i5.FirebaseAnalyticsHelper>(
      () => _i5.FirebaseAnalyticsHelper());
  gh.lazySingleton<_i6.GlobalNotification>(() => _i6.GlobalNotification());
  gh.singleton<_i7.HttpClient>(injectionModule.httpClient);
  gh.factory<_i8.IAccountRemoteSource>(() => _i9.AccountRemoteSource());
  gh.factory<_i10.IAccountRepository>(
      () => _i11.AccountRepository(get<_i8.IAccountRemoteSource>()));
  gh.factory<_i12.ISpHelper>(() => _i13.SPHelper());
  gh.lazySingleton<_i14.Logger>(() => injectionModule.logger);
  gh.lazySingleton<_i15.NetworkInfoImpl>(() => _i15.NetworkInfoImpl());
  await gh.factoryAsync<_i16.SharedPreferences>(() => injectionModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i17.Utilities>(() => _i17.Utilities());
  return get;
}

class _$InjectionModule extends _i18.InjectionModule {}
