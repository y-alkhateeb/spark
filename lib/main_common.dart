import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'core/common/appConfig.dart';
import 'di/service_locator.dart';
import 'env/config_reader.dart';
import 'env/enviroment.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize(env);


  switch (env) {
    case Environment.dev:
      break;
    case Environment.stage:
      break;
    case Environment.prod:
      debugPrint = (String? message, {int? wrapWidth}) {};
      break;
  }

  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  // Init Language.
  await AppConfig().fetchLocale();
  AppConfig().initApp();
  runApp(App());
}
