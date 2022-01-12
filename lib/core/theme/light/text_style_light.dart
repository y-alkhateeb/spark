import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    if (_instance == null) _instance = TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline2 = TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline3 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline4 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline5 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline6 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, );
  final TextStyle overline = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, );
  final TextStyle subtitle1 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, );
  final TextStyle subtitle2 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, );
  final TextStyle bodyText1 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, );
  final TextStyle bodyText2 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, );
}