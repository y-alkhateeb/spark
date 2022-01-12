import 'package:flutter/material.dart';

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
        // fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            brightness: Brightness.light,
            color: _appColorScheme.primary,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: _appColorScheme.primaryVariant, size: 21)),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            decorationThickness: 0,
          ),
          border: const UnderlineInputBorder(),
          labelStyle: TextStyle(
            decorationThickness: 0,
          ),
          errorStyle: const TextStyle(height: 0.8),
        ),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: _appColorScheme.error
        ),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
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
    return ColorScheme(
        primary: colorSchemeLight!.black,
        primaryVariant: Colors.white,
        //
        secondary: Colors.green,
        secondaryVariant: colorSchemeLight!.azure,
        surface: Colors.blue,
        //
        background: Color(0xfff6f9fc),
        //
        error: Colors.red[900]!,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black,
        //
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Color(0xFFF9B916),
        //
        brightness: Brightness.light,
    );
  }
}
