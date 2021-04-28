import 'package:spark/core/common/app_colors.dart';

import 'padding_insets.dart';
import 'text_style_light.dart';

abstract class ILightTheme {
  TextStyleLight? textThemeLight = TextStyleLight.instance;
  AppColors? colorSchemeLight = AppColors();
  PaddingInsets insets = PaddingInsets();
}