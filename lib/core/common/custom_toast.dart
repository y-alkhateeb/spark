import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'appConfig.dart';


enum ToastType { success, error, info }

class CustomToast {

  static Map<ToastType, Color> toastBgColors = {
    ToastType.success: AppConfig().currentTheme.colorScheme.primary,
    ToastType.error: AppConfig().currentTheme.colorScheme.error,
    ToastType.info: AppConfig().currentTheme.colorScheme.surface,
  };

  static showSnakeBar(msg,
      {Color? color,
      Color? textColor,
      ToastGravity? toastGravity,
      ToastType type = ToastType.error}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
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
