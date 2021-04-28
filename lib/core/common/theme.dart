import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.accentColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,

    appBarTheme: AppBarTheme(
        color: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.accentLightColor)
    ),

    buttonTheme: ButtonThemeData(
        buttonColor: AppColors.accentLightColor,
        disabledColor: AppColors.primaryColorDark
    )
);