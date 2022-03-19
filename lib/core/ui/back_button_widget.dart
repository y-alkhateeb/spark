import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app/app_constants.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Localizations.localeOf(context).languageCode ==
            ApplicationConstants.LANG_AR
        ? Positioned(
            top: 16.h,
            right: 24.w,
            child: _buildButtonWidget(context),
          )
        : Positioned(
            top: 16.h,
            left: 24.w,
            child: _buildButtonWidget(context),
          );
  }

  Widget _buildButtonWidget(BuildContext context) {
    return InkWell(
      onTap: (){
        context.router.pop();
      },
      child: Container(
        height: 40.w,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
