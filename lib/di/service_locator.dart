import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../core/navigation/base_route.gr.dart';
import '../core/net/base_option.dart';
import '../core/net/http_client.dart';
import 'service_locator.config.dart';

Future<void> setupInjection() async {

  final gh = GetItHelper(GetIt.I);
  //Components
  // make sure you register it as a Singleton or a lazySingleton
  gh.singleton(HttpClient(DioBaseOption().options));
  gh.singleton(Logger());
  gh.singleton(AppRouter());
}

@InjectableInit()
Future<void> configureDependencies() async => $initGetIt(GetIt.I);

