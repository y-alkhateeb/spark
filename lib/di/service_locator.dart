import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:spark/feature/account/data/datasources/account_remote.dart';
import '../core/net/http_client.dart';
import '../feature/account/data/datasources/iaccount_remote.dart';
import '../feature/account/data/repository/account_repository.dart';
import '../feature/account/domain/repository/iaccount_repository.dart';

Future<void> setupInjection() async {
  //Components
  GetIt.I.registerSingleton(HttpClient());

  GetIt.I.registerSingleton(Logger());

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
