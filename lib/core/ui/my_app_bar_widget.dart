import 'package:spark/core/common/extension/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'back_button_widget.dart';

class MyAppBarWidget extends StatelessWidget {
  final String title;

  const MyAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30.h,
          left: 0,
          right: 0,
          child: Text(
            title,
            style: context.textTheme.headline1!.copyWith(
              color: context.colors.onPrimaryContainer
            ),
            textAlign: TextAlign.center,
          ),
        ),
        BackButtonWidget(),
      ],
    );
  }
}
