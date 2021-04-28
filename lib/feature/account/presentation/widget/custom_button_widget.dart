import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/core/common/dimens.dart';

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
        style: TextStyle(
          color: textColor,
          fontSize: fontSize ?? Dimens.font_sp28.sp,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
