import 'package:auto_route/auto_route.dart';
import 'package:spark/feature/account/presentation/screen/login_screen.dart';
import 'package:spark/feature/account/presentation/screen/otp_screen.dart';
import 'package:spark/feature/account/presentation/screen/register_screen.dart';
import 'package:spark/feature/home/screen/base_home_screen.dart';
import 'package:spark/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../feature/home/screen/setting_screen.dart';
import '../../feature/tutorial/tutorial_screen.dart';
import '../../splash.dart';
import '../route/animated_route.dart';

typedef AnimatedRouteBuilder = Route<T> Function<T>(
    BuildContext context, Widget child, CustomPage page);


Route<T> myAnimatedRouteBuilder<T>(BuildContext context, Widget child, CustomPage<T> page){

  return AnimatedPage(
      fullscreenDialog: page.fullscreenDialog,
      // this is important
      settings: page,
      pageBuilder: (context, animation, secondaryAnimation) => ListenableProvider(
        create: (context) => animation,
        child: child,
      )
  );
}

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CupertinoRoute(
      page: SplashScreen,
      name: SplashScreen.routeName,
      initial: true,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    CupertinoRoute(
      page: TutorialScreen,
      name: TutorialScreen.routeName,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    CustomRoute(
      customRouteBuilder: myAnimatedRouteBuilder,
      page: LoginScreen,
      name: LoginScreen.routeName,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    CustomRoute(
      customRouteBuilder: myAnimatedRouteBuilder,
      page: RegisterScreen,
      name: RegisterScreen.routeName,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),

    CustomRoute(
      customRouteBuilder: myAnimatedRouteBuilder,
      page: OTPScreen,
      name: OTPScreen.routeName,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),

    CustomRoute(
      customRouteBuilder: myAnimatedRouteBuilder,
      page: SettingScreen,
      name: SettingScreen.routeName,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),


    CupertinoRoute(
      page: EmptyRouterPage,
      path: BaseHomeScreen.routeName,
      name: "BottomBarParent",
      children: [
        CupertinoRoute(page: BaseHomeScreen, path: "", name: "BottomBarRoute"),
        CupertinoRoute(page: HomeScreen, name: "HomeScreenRoute"),
      ],
    ),
  ],
)
class $AppRouter {}