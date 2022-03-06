import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:spark/feature/account/data/datasources/account_remote.dart';
import '../core/navigation/base_route.gr.dart';
import '../core/net/http_client.dart';
import '../env/config_reader.dart';
import '../feature/account/data/datasources/iaccount_remote.dart';
import '../feature/account/domain/repository/account_repository.dart';
import '../feature/account/domain/repository/iaccount_repository.dart';

Future<void> setupInjection() async {
  //Components
  GetIt.I.registerSingleton(HttpClient(
      BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        sendTimeout: 10000,
        responseType: ResponseType.json,
        baseUrl: ConfigReader.getBaseUrl(),
      )
  ));

  GetIt.I.registerSingleton(Logger());

  // make sure you register it as a Singleton or a lazySingleton
  GetIt.I.registerSingleton<AppRouter>(AppRouter());

  /// here just register UserManagementRepository as a Singleton
  /// to get instance from this class and call when we need delete tokens
  GetIt.I.registerLazySingleton<AccountRepository>(
      () => AccountRepository(GetIt.I<IAccountRemoteSource>()));


  // Account Remote data source
  GetIt.I.registerFactory<IAccountRemoteSource>(
          () => AccountRemoteSource());

  // Account Repositories
  GetIt.I.registerFactory<IAccountRepository>(
      () => AccountRepository(GetIt.I<IAccountRemoteSource>()));
}
