import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:spark/core/theme/light/text_style_light.dart';

extension loggerExtension on String{
  void get logE => GetIt.I<Logger>().e(this);
  void get logW => GetIt.I<Logger>().w(this);
}

extension textStyle on Color{
  TextStyle get headline14 => TextStyleLight.instance.headline14.copyWith(color: this);
  TextStyle get headline18 => TextStyleLight.instance.headline18.copyWith(color: this);
  TextStyle get headline20 => TextStyleLight.instance.headline20.copyWith(color: this);
  TextStyle get headline22 => TextStyleLight.instance.headline22.copyWith(color: this);
  TextStyle get headline24 => TextStyleLight.instance.headline24.copyWith(color: this);
  TextStyle get headline28 => TextStyleLight.instance.headline28.copyWith(color: this);
  TextStyle get headline34 => TextStyleLight.instance.headline34.copyWith(color: this);
  TextStyle get headline40 => TextStyleLight.instance.headline40.copyWith(color: this);
  TextStyle get headline48 => TextStyleLight.instance.headline48.copyWith(color: this);
  TextStyle get headline60 => TextStyleLight.instance.headline60.copyWith(color: this);
  TextStyle get headline70 => TextStyleLight.instance.headline70.copyWith(color: this);
  TextStyle get headline96 => TextStyleLight.instance.headline96.copyWith(color: this);
}