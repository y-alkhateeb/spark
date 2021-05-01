import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:spark/core/theme/light/text_style_light.dart';

extension loggerExtension on String{
  void get logE => GetIt.I<Logger>().e(this);
  void get logW => GetIt.I<Logger>().w(this);
}

extension textStyle on Color{
  TextStyle get headline14 => TextStyleLight().headline14.copyWith(color: this);
  TextStyle get headline18 => TextStyleLight().headline18.copyWith(color: this);
  TextStyle get headline20 => TextStyleLight().headline20.copyWith(color: this);
  TextStyle get headline22 => TextStyleLight().headline22.copyWith(color: this);
  TextStyle get headline24 => TextStyleLight().headline24.copyWith(color: this);
  TextStyle get headline28 => TextStyleLight().headline28.copyWith(color: this);
  TextStyle get headline34 => TextStyleLight().headline34.copyWith(color: this);
  TextStyle get headline40 => TextStyleLight().headline40.copyWith(color: this);
  TextStyle get headline48 => TextStyleLight().headline48.copyWith(color: this);
  TextStyle get headline60 => TextStyleLight().headline60.copyWith(color: this);
  TextStyle get headline70 => TextStyleLight().headline70.copyWith(color: this);
  TextStyle get headline96 => TextStyleLight().headline96.copyWith(color: this);
}