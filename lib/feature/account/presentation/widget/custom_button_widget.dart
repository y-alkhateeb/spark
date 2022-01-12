import 'package:flutter/cupertino.dart';
import 'package:spark/core/common/resource.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final Color? textColor;
  final Function() onPressed;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    Key? key,
    this.color,
    required this.text,
    this.textColor,
    required this.onPressed,
    this.fontSize,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      borderRadius: BorderRadius.circular(30),
      color: color,
      pressedOpacity: 0.7,
      child: Text(
        text,
        style: context.textTheme.headline2!.copyWith(
          color: textColor ?? context.colors.surface,
          fontSize: fontSize,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
