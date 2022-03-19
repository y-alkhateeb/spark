import 'package:flutter/material.dart';
import 'package:spark/core/theme/dark/dark_theme_interface.dart';

import '../theme/app_theme.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;

  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        shadowColor: _appColorScheme.primaryVariant,
        dividerColor: _appColorScheme.primaryVariant,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
            color: _appColorScheme.primary,
            elevation: 5,
            centerTitle: true,
            shadowColor: _appColorScheme.primaryVariant,
            titleTextStyle: TextStyle(
              fontSize: textThemeLight!.headline1.fontSize,
              color: _appColorScheme.surface
            ),
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
        scaffoldBackgroundColor: _appColorScheme.primary,
        floatingActionButtonTheme:
            ThemeData.dark().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.dark().buttonTheme.copyWith(
              colorScheme: ColorScheme.dark(
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
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
    );
  }

  TextTheme textTheme() {
    return ThemeData.dark().textTheme.copyWith(
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
        secondary: Colors.blueAccent,
        secondaryVariant: colorSchemeLight!.azure,
        surface: Colors.blue,
        //
        background: Color(0xfff6f9fc),
        //
        error: Colors.red,
        onPrimary: Colors.white38,
        onSecondary: Colors.black54,
        //
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError:Colors.limeAccent,
        //
        brightness: Brightness.dark,
    );
  }
}
