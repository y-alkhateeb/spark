import 'package:flutter/material.dart';

import '../constants/app/app_constants.dart';
import '../datasource/shared_preference.dart';

class LocalizationProvider extends ChangeNotifier {
  static final LocalizationProvider _instance = LocalizationProvider._init();
  static LocalizationProvider get instance => _instance;

  LocalizationProvider._init();

  Locale _appLocale = Locale(ApplicationConstants.LANG_EN);

  /// Get current Locale supported
  Locale get appLocal => _appLocale;

  String get currentLanguage => appLocal.languageCode;

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
}
