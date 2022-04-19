import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'appConfig.dart';


enum ToastType { success, error, info }

class CustomToast {

  static Map<ToastType, Color> toastBgColors = {
    ToastType.success: GetIt.I<AppConfig>().currentTheme.colorScheme.primary,
    ToastType.error: GetIt.I<AppConfig>().currentTheme.colorScheme.error,
    ToastType.info: GetIt.I<AppConfig>().currentTheme.colorScheme.surface,
  };

  static showSnakeBar(msg,
      {Color? color,
      Color? textColor,
      ToastGravity? toastGravity,
      ToastType type = ToastType.error}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.CENTER,
        backgroundColor: color ?? toastBgColors[type],
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  static showSimpleToast(
      {required String msg,
      Color? color,
      Color? textColor,
        ToastType type = ToastType.error}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: color ?? toastBgColors[type],
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }
}
