import 'package:spark/core/common/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyLogoOnbgWidget extends StatelessWidget {
  const MyLogoOnbgWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      left: 0,
      right: 0,
      child: Image.asset(
        ApplicationConstants.IMAGE_LOGO,
        height: 54.h,
        width: 100.w,
      ),
    );
  }
}
