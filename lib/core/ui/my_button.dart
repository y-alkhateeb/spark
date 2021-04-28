import 'package:flutter/material.dart';
import 'package:spark/core/common/app_colors.dart';
import 'package:spark/core/common/dimens.dart';

class MyButton extends StatelessWidget {

  const MyButton({
    Key? key,
    this.text = '',
    this.fontSize = Dimens.font_sp20,
    this.textColor,
    this.disabledTextColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.minHeight = 48.0,
    this.minWidth = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.radius = 2.0,
    this.side = BorderSide.none,
    required this.onPressed,
  }): super(key: key);

  final String text;
  final double fontSize;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? minHeight;
  final double? minWidth;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(text, style: TextStyle(fontSize: fontSize),),
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledTextColor ?? AppColors.text_gray;
            }
            return textColor ?? Colors.white;
          },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledBackgroundColor ?? AppColors.text_gray;
            }
            return backgroundColor ?? AppColors.text_gray;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return (textColor ?? Colors.white).withOpacity(0.12);
          }),
          minimumSize: (minWidth == null || minHeight == null) ? null : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(side),
        )
    );
  }
}