import 'package:flutter/material.dart';
import 'package:spark/core/route/animated_route.dart';
import 'package:spark/core/route/fade_route.dart';
import 'package:spark/feature/account/presentation/screen/login_screen.dart';
import 'package:spark/feature/account/presentation/screen/register_screen.dart';
import 'package:spark/feature/home/screen/bottom_bar.dart';

import '../../splash.dart';
import 'INavigationService.dart';

/// [HomeNS] = [NavigationService]
class HomeNS extends INavigationService {
  static final HomeNS _instance = HomeNS._init();

  HomeNS._init();

  factory HomeNS() {
    return _instance;
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  Future<void> replacementToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushReplacementNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  @override
  void goBack() {
    unFocus();
    Navigator.pop(context);
  }

  @override
  void unFocus() {
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case Splash.routeName:
        return FadeRoute(page: Splash());
      case LoginScreen.routeName:
        return FadeRoute(page: LoginScreen());
      case RegisterScreen.routeName:
        return AnimatedRoute(page: RegisterScreen());
      case BottomBar.routeName:
        return FadeRoute(page: BottomBar());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return errorRoute();
    }
  }
}