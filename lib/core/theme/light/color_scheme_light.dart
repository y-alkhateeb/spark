import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    if (_instance == null) _instance = ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final Color primary = Color(0xFFF9656B);
  final  Color secondary = Color(0xff30e3a0);
  final  Color headerColor = Color(0xff6e7c87);
  final  Color bg= Color(0xfffffafa);
  final  Color offWhite= Color(0xffF2F2F2);
  final  Color gold= Color(0xffe4aa69);
  final  Color grey= Colors.grey;
  final  Color greyBold= Color(0xffEEEEEE);
  final Color greyWhite=Colors.grey.withOpacity(.2);
  final  Color black= Color(0xff031626);
  final  Color blackOpacity=Colors.black54;
  final  Color white=Colors.white;
  final  Color successColor=Color(0xff03A89E);
  final  Color errorColor= Colors.red;
  final  Color infoColor= Color(0xfffea632);
}