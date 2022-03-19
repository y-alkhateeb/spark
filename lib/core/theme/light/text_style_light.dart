import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    if (_instance == null) _instance = TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 = GoogleFonts.ubuntu(fontSize: 24.sp, fontWeight: FontWeight.bold,);
  final TextStyle headline2 = GoogleFonts.ubuntu(fontSize: 22.sp, fontWeight: FontWeight.bold,);
  final TextStyle headline3 = GoogleFonts.ubuntu(fontSize: 20.sp, fontWeight: FontWeight.bold,);
  final TextStyle headline4 = GoogleFonts.ubuntu(fontSize: 18.sp, fontWeight: FontWeight.w500,);
  final TextStyle headline5 = GoogleFonts.ubuntu(fontSize: 16.sp, fontWeight: FontWeight.w500,);
  final TextStyle headline6 = GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w500,);
  final TextStyle overline = GoogleFonts.ubuntu(fontSize: 24.sp, fontWeight: FontWeight.bold,);
  final TextStyle subtitle1 = GoogleFonts.ubuntu(fontSize: 16.sp, fontWeight: FontWeight.w300,);
  final TextStyle subtitle2 = GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w300,);
  final TextStyle bodyText1 = GoogleFonts.ubuntu(fontSize: 16.sp, fontWeight: FontWeight.normal,);
  final TextStyle bodyText2 = GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.normal,);
}