import 'package:flutter/material.dart';
import 'package:spark/core/route/animated_route.dart';
import 'package:spark/core/route/fade_route.dart';
import 'package:spark/feature/account/presentation/screen/login_screen.dart';
import 'package:spark/feature/account/presentation/screen/register_screen.dart';
import 'package:spark/feature/home/screen/bottom_bar.dart';
import 'package:spark/feature/home/screen/home_screen.dart';
import 'package:spark/feature/home/screen/screen_one.dart';
import 'package:spark/feature/home/screen/screen_two.dart';

import 'INavigationService.dart';

/// [MoreNS] = [NavigationService]
class MoreNS extends INavigationService {
  static final MoreNS _instance = MoreNS._init();

  MoreNS._init();

  factory MoreNS() {
    return _instance;
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  @override
  void goBack() {
    unFocus();
    print("goBack()");
    if(navigatorKey.currentState!.canPop())
      navigatorKey.currentState!.maybePop();
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
      case HomeScreen.routeName:
        return FadeRoute(page: HomeScreen());
      case ScreenOne.routeName:
        return FadeRoute(page: ScreenOne());
      case ScreenTwo.routeName:
        return FadeRoute(page: ScreenTwo());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return errorRoute();
    }
  }
}