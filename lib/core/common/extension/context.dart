import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get bodyHeight => MediaQuery.of(this).size.height
      - MediaQuery.of(this).viewPadding.top - kToolbarHeight;
  double get width => MediaQuery.of(this).size.width;
}