import 'dart:io';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:spark/core/common/resource.dart';
import 'package:spark/core/constants/enums/app_theme_enum.dart';
import 'package:spark/core/datasource/shared_preference.dart';
import 'package:spark/core/theme/app_theme_dark.dart';
import 'package:spark/core/theme/app_theme_light.dart';

class AppConfig extends ChangeNotifier{
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();



  /// [_appLocale] app language, first start will be English we can change it
  /// from here
  Locale _appLocale = Locale(ApplicationConstants.LANG_EN);

  /// Get current Locale supported
  Locale get appLocal => _appLocale;

  /// Get current language code like [EN] or [AR]
  String get currentLanguage => appLocal.languageCode;


  /// call this method in main function before start MyApp to handle the language
  fetchLocale() async {
    var prefs = await SpUtil.getInstance();

    /// check if the application is first start or not
    if (prefs.getBool(ApplicationConstants.KEY_FIRST_START) == null) {
      /// set first start is true
      await prefs.putBool(ApplicationConstants.KEY_FIRST_START, true);
    }
    if (prefs.getString(ApplicationConstants.KEY_LANGUAGE) == null) {
      _appLocale = Locale(ApplicationConstants.LANG_EN);
      await prefs.putString(ApplicationConstants.KEY_LANGUAGE, ApplicationConstants.LANG_EN);
      return Null;
    }
    String? local = prefs.getString(ApplicationConstants.KEY_LANGUAGE);
    _appLocale = Locale(local??ApplicationConstants.LANG_EN);
    return Null;
  }


  /// this method to change language and [notifyListeners] to notify all widget
  Future<void> changeLanguage(Locale type, BuildContext context) async {
    var prefs = await SpUtil.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale(ApplicationConstants.LANG_AR)) {
      _appLocale = Locale(ApplicationConstants.LANG_AR);
      await prefs.putString(ApplicationConstants.KEY_LANGUAGE, ApplicationConstants.LANG_AR);
    } else {
      _appLocale = Locale(ApplicationConstants.LANG_EN);
      await prefs.putString(ApplicationConstants.KEY_LANGUAGE, ApplicationConstants.LANG_EN);
    }
    notifyListeners();
  }

  /// don't set default value here
  ThemeData? _currentTheme;

  AppThemes _currentThemeEnum = AppThemes.LIGHT;

  /// Application theme enum.
  /// Default value is [AppThemes.LIGHT]
  AppThemes get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme ?? AppThemeLight.instance.theme;

  /// Change your app theme with [currentThemeEnum] value.
  void changeTheme() {
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppThemeDark.instance.theme;
      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currentThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }

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
}
