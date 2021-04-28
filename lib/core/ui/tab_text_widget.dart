import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/dimens.dart';

class TabTextWidget extends StatelessWidget {
  final String txt;
  final String icon;

  const TabTextWidget({Key? key,required this.txt,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(icon,scale: 4,),
        Text(
          txt,
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: Dimens.font_sp18.sp),
        ),
      ],
    );
  }
}
