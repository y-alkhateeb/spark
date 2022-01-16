import 'package:auto_route/auto_route.dart';
import 'package:spark/feature/account/presentation/screen/login_screen.dart';
import 'package:spark/feature/account/presentation/screen/register_screen.dart';
import 'package:spark/feature/home/screen/bottom_bar.dart';
import 'package:spark/feature/home/screen/home_screen.dart';
import 'package:spark/feature/home/screen/screen_one.dart';
import 'package:spark/feature/home/screen/screen_two.dart';

import '../../splash.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: Splash,
      name: "SplashRoute",
      initial: true,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      page: LoginScreen,
      name: "LoginScreenRoute",
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      page: RegisterScreen,
      name: "RegisterScreenRoute",
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: BottomBar.routeName,
      name: "BottomBarParent",
      page: EmptyRouterPage,
      children: [
        AutoRoute(page: BottomBar, path: "", name: "BottomBarRoute"),
        AutoRoute(page: HomeScreen, name: "HomeScreenRoute"),
        AutoRoute(page: ScreenOne, name: "ScreenOneRoute"),
        AutoRoute(page: ScreenTwo, name: "ScreenTwoRoute"),
      ],
    ),
  ],
)
class $AppRouter {}