import 'package:flutter/material.dart';
import 'package:spark/core/constants/enums/app_theme_enum.dart';
import 'package:spark/core/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData();//AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}