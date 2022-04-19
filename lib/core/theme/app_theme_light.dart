import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/my_color_scheme.dart';
import 'light/light_theme_interface.dart';
import '../theme/app_theme.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(_appColorScheme.primary),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(_appColorScheme.onPrimary),
          fillColor: MaterialStateProperty.all(_appColorScheme.primary),
        ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            color: _appColorScheme.primary,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: textThemeLight!.headline1.fontSize,
              color: _appColorScheme.onPrimary
            ),
            iconTheme: IconThemeData(color: _appColorScheme.onPrimary, size: 21),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            decorationThickness: 0,
          ),
          border: const OutlineInputBorder(),
          labelStyle: TextStyle(
            decorationThickness: 0,
          ),
          errorStyle: const TextStyle(height: 0.8),
        ),
        scaffoldBackgroundColor: _appColorScheme.background,
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return _appColorScheme.onBackground;
              }
              return _appColorScheme.primary;
            },
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return _appColorScheme.onBackground;
              }
              return _appColorScheme.primary;
            },
            ),
            overlayColor: MaterialStateProperty.resolveWith((states) {
              return (Colors.white).withOpacity(0.12);
            }),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15.r)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(color: _appColorScheme.primary,width: 3)),
          )
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: _appColorScheme.error
        ),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
        headline1: textThemeLight!.headline1,
        headline2: textThemeLight!.headline2,
        headline3: textThemeLight!.headline3,
        headline4: textThemeLight!.headline4,
        headline5: textThemeLight!.headline5,
        headline6: textThemeLight!.headline6,
        subtitle1: textThemeLight!.subtitle1,
        subtitle2: textThemeLight!.subtitle2,
        bodyText1: textThemeLight!.bodyText1,
        bodyText2: textThemeLight!.bodyText2,
        overline: textThemeLight!.headline3,
    );
  }

  /// https://material.io/design/color/the-color-system.html#color-theme-creation
  ColorScheme get _appColorScheme {
    return MyColorScheme.light().colorScheme;
  }
}
