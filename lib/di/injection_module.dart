import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/navigation/base_route.gr.dart';
import '../core/net/base_option.dart';
import '../core/net/net.dart';

@module
abstract class InjectionModule {

  //injecting third party libraries

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Logger get logger => Logger();

  @singleton
  AppRouter get appRouter => AppRouter();

  @singleton
  HttpClient get httpClient => HttpClient(DioBaseOption().options);

}