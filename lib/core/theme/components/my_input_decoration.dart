import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/appConfig.dart';
import 'my_color_scheme.dart';




class MyInputDecoration extends InputDecoration {
  final String lang;
  final String? labelTxt;
  final String? hint;
  final Widget? prefIcon;
  final Widget? sufIcon;
  final Color? enableColor;
  final Color? focsColor;
  final Color? hintColor;
  final Color? customFillColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  const MyInputDecoration(
      {required this.lang,
      this.hint,
      this.labelTxt,
      this.prefIcon,
      this.sufIcon,
      this.hintColor,
      this.customFillColor,
      this.enableColor,
      this.focsColor,
      this.borderRadius,
      this.padding})
      : super();

  @override
  // TODO: implement enabledBorder
  InputBorder get enabledBorder => OutlineInputBorder(
        borderSide:
            BorderSide(color: enableColor ?? GetIt.I<AppConfig>().currentTheme.colorScheme.background, width: .7),
        borderRadius: borderRadius ?? BorderRadius.circular( 10),
      );

  @override
  // TODO: implement focusedBorder
  InputBorder get focusedBorder => OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular( 10),
      borderSide: BorderSide(color: focusColor ?? GetIt.I<AppConfig>().currentTheme.colorScheme.primary, width: 1));

  @override
  // TODO: implement errorBorder
  InputBorder get errorBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: .5),
      borderRadius: borderRadius ?? BorderRadius.circular( 10));

  @override
  // TODO: implement focusedErrorBorder
  InputBorder get focusedErrorBorder => OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular( 10),
      borderSide: const BorderSide(color: Colors.red, width: 2));

  @override
  // TODO: implement errorStyle
  TextStyle get errorStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 12)
      : GoogleFonts.cairo(fontSize: 10);

  @override
  // TODO: implement hintText
  String? get hintText => hint;

  @override
  // TODO: implement label
  Widget? get label => labelTxt==null?super.label:Text(labelTxt??"",style: labelStyle,);

  @override
  // TODO: implement labelStyle
  TextStyle get labelStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 16, color: hintColor ?? Colors.black54)
      : GoogleFonts.cairo(fontSize: 14, color: hintColor ?? Colors.black54);

  @override
  // TODO: implement hintStyle
  TextStyle? get hintStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 16, color: hintColor ?? Colors.black54)
      : GoogleFonts.cairo(fontSize: 14, color: hintColor ?? Colors.black54);

  @override
  // TODO: implement contentPadding
  EdgeInsetsGeometry get contentPadding =>
      padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 18);

  @override
  // TODO: implement filled
  bool get filled => true;

  @override
  // TODO: implement fillColor
  Color get fillColor => customFillColor ?? Colors.transparent;

  @override
  // TODO: implement alignLabelWithHint
  bool get alignLabelWithHint => true;

  @override
  // TODO: implement suffixIcon
  Widget? get suffixIcon => sufIcon;

  @override
  // TODO: implement prefixIcon
  Widget? get prefixIcon => prefIcon;

  @override
  // TODO: implement focusColor
  Color? get focusColor => focsColor;
}
