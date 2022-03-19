import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spark/core/common/resource.dart';
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
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;


  const MyTextFormField({
    Key? key,
    this.formKey,
    this.controller,
    this.autofocus = false,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.focusNode,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.inputFormatters,
    this.hintText,
    this.autofillHints,
    this.contentPadding,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      controller: controller,
      autofocus: autofocus,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      focusNode: focusNode,
      autofillHints: autofillHints,
      cursorColor: context.colors.onSurface,
      style: TextStyle(
        color: context.colors.onSurface,
        decorationThickness: 0,
        decorationColor: context.colors.onSurface,
        fontSize: context.textTheme.headline6!.fontSize
      ),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12),
        hintStyle: TextStyle(
          color: context.colors.onSurface,
          decorationThickness: 0,
          decorationColor: context.colors.onSurface,
          fontSize: context.textTheme.headline6!.fontSize,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.surface,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.surface,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.error,
          ),
        ),
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(
          color: context.colors.onPrimaryContainer,
          decorationThickness: 0,
          decorationColor: context.colors.onPrimaryContainer,
          fontSize: context.textTheme.headline5!.fontSize,
        ),
        labelText: labelText,
        suffixIcon: suffixIcon,
        errorStyle: TextStyle(
            fontSize: context.textTheme.headline6!.fontSize,
            height: 0.8,
        ),
      ),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: obscureText,
      inputFormatters: keyboardType == TextInputType.phone?
      <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        syMobileFormatter,
      ]
          :
      inputFormatters,
    );
  }
}
