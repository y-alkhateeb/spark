import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleLight {
  static TextStyleLight? _instace;
  static TextStyleLight get instance {
    if (_instace == null) _instace = TextStyleLight._init();
    return _instace!;
  }

  TextStyleLight._init();

  final TextStyle headline1 = TextStyle(fontSize: 96.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline1small = TextStyle(fontSize: 82.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 = TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline2small = TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w400);
  final TextStyle headline3small = TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w400);
  final TextStyle headline4 = TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle headline4small = TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle headline5 = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400);
  final TextStyle headline5small = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);
  final TextStyle overline = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}