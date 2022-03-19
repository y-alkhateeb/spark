import 'package:spark/core/common/extension/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/dimens.dart';
import '../route/animated_route.dart';

class MyScreenContainerWidget extends StatelessWidget {
  final double top;
  final Widget child;

  const MyScreenContainerWidget({
    Key? key,
    required this.top,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: 0,
      left: 0,
      right: 0,
      child: SlidingUpAnimated(
        initialOffsetY: 1,
        intervalStart: 0.5,
        intervalEnd: 1.0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          child: Container(
            color: context.colors.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.dp32),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
