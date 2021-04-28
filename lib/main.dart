import 'package:flutter/material.dart';
import 'app.dart';
import 'core/common/appConfig.dart';
import 'core/localization/localization_provider.dart';
import 'di/service_locator.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  // Init Language.
  await LocalizationProvider.instance.fetchLocale();
  AppConfig().initVersion();
  runApp(App());
}