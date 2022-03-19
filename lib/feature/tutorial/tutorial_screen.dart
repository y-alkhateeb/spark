import 'package:auto_route/auto_route.dart';
import 'package:spark/core/navigation/base_route.gr.dart';
import 'package:spark/core/ui/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/resource.dart';

class TutorialScreen extends StatefulWidget {
  static const routeName = "TutorialScreenRoute";
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  late PageController controller;


  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0,keepPage: false);
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          image: DecorationImage(
            image: ExactAssetImage(ApplicationConstants.IMAGE_BACKGROUND),
            fit: BoxFit.cover,
            opacity: 0.5
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 100.h,
                  bottom: 370.h,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      ApplicationConstants.IMAGE_WELCOME_1,
                      alignment: Alignment.center,
                    ),
                ),
                Positioned(
                  top: 490.h,
                  bottom: 220.h,
                  left: 25.w,
                  right: 25.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Get Reliable & Affordable Services instantly",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,

                        ),
                      ),
                      Text(
                        "Now it is very easy to find your home services. We have a lot of professional workers",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 130.h,
                  left: 25.w,
                  right: 25.w,
                  child: MyTextButton.secondary(
                    onPressed: (){
                      controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInCubic);
                    },
                    text: S.of(context).start_exploring,
                  ),
                ),
                Positioned(
                  bottom: 90.h,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: (){
                      context.router.pushAndPopUntil(LoginScreenRoute(), predicate: (Route<dynamic> route) => false,);
                    },
                    child: Text(
                      S.of(context).label_skip_tour,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline6!.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  top: 100.h,
                  bottom: 370.h,
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    ApplicationConstants.IMAGE_WELCOME_2,
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                  top: 490.h,
                  bottom: 220.h,
                  left: 25.w,
                  right: 25.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Get Reliable & Affordable Services instantly",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,

                        ),
                      ),
                      Text(
                        "Now it is very easy to find your home services. We have a lot of professional workers",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 130.h,
                  left: 25.w,
                  right: 25.w,
                  child: MyTextButton.primary(
                    onPressed: (){
                      context.router.replace(LoginScreenRoute());
                    },
                    text: S.of(context).label_Login,
                  ),
                ),
                Positioned(
                  bottom: 60.h,
                  left: 25.w,
                  right: 25.w,
                  child: MyTextButton.primary(
                    onPressed: (){
                      context.router.replace(RegisterScreenRoute());
                    },
                    text: S.of(context).label_register,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
