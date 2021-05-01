import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleLight {
  static TextStyleLight _instance = TextStyleLight._init();

  factory TextStyleLight() => _instance;

  TextStyleLight._init();

  final TextStyle headline96 = TextStyle(fontSize: 96.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline80 = TextStyle(fontSize: 82.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline70 = TextStyle(fontSize: 70.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline60 = TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline48 = TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w400);
  final TextStyle headline40 = TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w400);
  final TextStyle headline34 = TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle headline28 = TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle headline24 = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400);
  final TextStyle headline22 = TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400);
  final TextStyle headline20 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400);
  final TextStyle headline18 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, letterSpacing: 1.5);
  final TextStyle headline14 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}