import 'dart:io';
import 'package:package_info/package_info.dart';
import 'package:spark/core/common/resource.dart';
import 'package:spark/core/datasource/shared_preference.dart';

// This class it contain tow functions
// for get device info
// and for get and set language
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  final String apiKey = "";
  String? _os;
  String? _currentVersion;
  String? _buildNumber;
  String? _appName;
  String? _appVersion;

  String? get os => _os;
  String? get currentVersion => _currentVersion;
  String? get buildNumber => _buildNumber;
  String? get appVersion => _appVersion;
  String? get appName => _appName;

  initApp() async {
    /// get OS
    if (Platform.isIOS) {
      _os = "ios";
    }
    if (Platform.isAndroid) {
      _os = "android";
    }

    /// get version
    final packageInfo = await PackageInfo.fromPlatform();
    _currentVersion = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    _appName = packageInfo.appName;
  }

  /// deleteToken
  Future<void> deleteToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(ApplicationConstants.KEY_TOKEN);
  }

  /// deleteFcmToken
  Future<void> deleteFcmToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }

  /// persistToken
  Future<void> persistToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(ApplicationConstants.KEY_TOKEN, token);
  }

  /// persistFcmToken
  Future<void> persistFcmToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(ApplicationConstants.KEY_FIREBASE_TOKEN, token);
  }


  /// read authToken
  /// if returns null thats means there no SP instance
  Future<String?> get authToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_TOKEN);
  }

  /// read fcmToken
  /// if returns null thats means there no SP instance
  Future<String?> get fcmToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }


  /// check if hasToken or not
  Future<bool> get hasToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_TOKEN);
    if (token != null) return true;
    return false;
  }

  /// check if hasFcmToken or not
  Future<bool> get hasFcmToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }
}
