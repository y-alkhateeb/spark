import 'dart:io';
import 'package:package_info/package_info.dart';

// This class it contain tow functions
// for get device info
// and for get and set language
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  int? os;
  String? currentVersion;
  String? buildNumber;
  String? appName;

  initVersion() async {
    /// get OS
    if (Platform.isIOS) {
      os = 2;
    }
    if (Platform.isAndroid) {
      os = 1;
    }

    /// get version
    final packageInfo = await PackageInfo.fromPlatform();
    currentVersion = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    appName = packageInfo.appName;
  }
}
