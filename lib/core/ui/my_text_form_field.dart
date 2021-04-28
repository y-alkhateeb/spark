import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/core/common/app_colors.dart';
import '../common/dimens.dart';
import '../common/text_formater.dart';

class MyTextFormField extends StatelessWidget {
  final GlobalKey<FormFieldState<String>>? formKey;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color color;
  final List<TextInputFormatter>? inputFormatters;


  const MyTextFormField({
    Key? key,
    this.formKey,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.focusNode,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.color = AppColors.lightFontColor,
    this.inputFormatters,
    this.hintText,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      focusNode: focusNode,
      cursorColor: color,
      style: TextStyle(
        color: color,
        decorationThickness: 0,
        decorationColor: color,
        fontSize: Dimens.font_sp28.sp
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: color,
          decorationThickness: 0,
          decorationColor: color,
          fontSize: Dimens.font_sp28.sp,
        ),
        focusedBorder:  UnderlineInputBorder(
          borderSide:  BorderSide(
            color: color,
          ),
        ),
        enabledBorder:  UnderlineInputBorder(
          borderSide:  BorderSide(
            color: color,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.redColor,
          ),
        ),
        border: const UnderlineInputBorder(),
        labelStyle: TextStyle(
          color: color,
          decorationThickness: 0,
          decorationColor: color,
          fontSize: Dimens.font_sp28.sp,
        ),
        labelText: labelText,
        suffixIcon: suffixIcon,
        errorStyle: const TextStyle(height: 0.8),
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: obscureText,
      inputFormatters: keyboardType == TextInputType.phone?
      <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        mobileFormatter,
      ]
          :
      inputFormatters,
    );
  }
}
