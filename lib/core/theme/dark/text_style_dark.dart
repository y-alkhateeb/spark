import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemeDark {
  static TextThemeDark? _instance;
  static TextThemeDark? get instance {
    if (_instance == null) _instance = TextThemeDark._init();
    return _instance;
  }

  TextThemeDark._init();

  final TextStyle headline1 = TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline2 = TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline3 = TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline4 = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline5 = TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, );
  final TextStyle headline6 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, );
  final TextStyle overline = TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, );
  final TextStyle subtitle1 = TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w300, );
  final TextStyle subtitle2 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300, );
  final TextStyle bodyText1 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300, );
  final TextStyle bodyText2 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300, );
}