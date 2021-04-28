import 'package:flutter/material.dart';
import 'package:spark/core/route/animated_route.dart';
import 'package:spark/core/route/fade_route.dart';
import 'package:spark/feature/account/presentation/screen/login_screen.dart';
import 'package:spark/feature/account/presentation/screen/register_screen.dart';
import 'package:spark/feature/home/screen/home_page.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case LoginScreen.routeName:
        return FadeRoute(page: LoginScreen());
      case RegisterScreen.routeName:
        return AnimatedRoute(page: RegisterScreen());
      case HomePage.routeName:
        return FadeRoute(page: HomePage());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }


  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}