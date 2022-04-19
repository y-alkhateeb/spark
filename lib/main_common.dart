import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'core/common/appConfig.dart';
import 'core/common/firebase_analytics_helper.dart';
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

  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await configureDependencies();
  GetIt.I<FirebaseAnalyticsHelper>().analytics.setConsent(
      adStorageConsentGranted: false, analyticsStorageConsentGranted: true);
  // Init Language.
  await AppConfig().fetchLocale();
  AppConfig().initApp();
  runApp(App());
}
