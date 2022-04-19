import 'package:flutter/material.dart';

class MyColorScheme {

  const MyColorScheme.light({
    this.colorScheme = const ColorScheme.light(
      primary: const Color(0xffF8BA2C),
      onPrimary: Colors.white,
      secondary: const Color(0xffF2BC25),
      onSecondary: Colors.black,
      surface: const Color(0xfff0f1f2),
      onSurface: Color(0xff777777),
      background: Colors.transparent,
      onBackground: Colors.black87,
      primaryContainer: Colors.white,
      onPrimaryContainer: Color(0xff23496B),
      error: const Color(0xFFB71C1C),
      onError: const Color(0xFFFFFFFF),
      brightness: Brightness.light,
    ),
  });

  const MyColorScheme.dark({
    this.colorScheme = const ColorScheme.light(
      primary: const Color(0xffF8BA2C),
      onPrimary: Colors.white,
      secondary: const Color(0xffF2BC25),
      onSecondary: Colors.black,
      surface: const Color(0xfff0f1f2),
      onSurface: Color(0xff777777),
      background: Colors.transparent,
      onBackground: Colors.black87,
      primaryContainer: Colors.white,
      onPrimaryContainer: Color(0xff23496B),
      error: const Color(0xFFB71C1C),
      onError: const Color(0xFFFFFFFF),
      brightness: Brightness.light,
    ),
  });


  final ColorScheme colorScheme;
}
