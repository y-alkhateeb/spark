import 'package:flutter/material.dart';
import 'app.dart';
import 'core/common/appConfig.dart';
import 'di/service_locator.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  // Init Language.
  await AppConfig().fetchLocale();
  AppConfig().initApp();
  runApp(App());
}