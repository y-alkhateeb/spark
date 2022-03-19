import 'package:spark/core/common/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      if(!Scaffold.of(context).isDrawerOpen)
                          Scaffold.of(context).openDrawer();
                    },
                    child: Image.asset(
                        ApplicationConstants.IMAGE_DRAWER_BUTTON_MENU,
                      height: 40.w,
                      width: 40.w,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                    },
                    child: ImageIcon(
                        AssetImage(ApplicationConstants.IMAGE_DRAWER_PROFILE),
                      color: context.colors.primary,
                      size: 40.r,
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
