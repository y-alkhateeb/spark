// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i9;

import '../../feature/account/presentation/screen/login_screen.dart' as _i2;
import '../../feature/account/presentation/screen/register_screen.dart' as _i3;
import '../../feature/home/screen/bottom_bar.dart' as _i5;
import '../../feature/home/screen/home_screen.dart' as _i6;
import '../../feature/home/screen/screen_one.dart' as _i7;
import '../../feature/home/screen/screen_two.dart' as _i8;
import '../../splash.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.Splash());
    },
    LoginScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginScreen());
    },
    RegisterScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterScreen());
    },
    BottomBarParent.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    BottomBarRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.BottomBar());
    },
    HomeScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    ScreenOneRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ScreenOne());
    },
    ScreenTwoRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ScreenTwo());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashRoute.name, path: '/', children: [
          _i4.RouteConfig('*#redirect',
              path: '*',
              parent: SplashRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i4.RouteConfig(LoginScreenRoute.name,
            path: '/login-screen',
            children: [
              _i4.RouteConfig('*#redirect',
                  path: '*',
                  parent: LoginScreenRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i4.RouteConfig(RegisterScreenRoute.name,
            path: '/register-screen',
            children: [
              _i4.RouteConfig('*#redirect',
                  path: '*',
                  parent: RegisterScreenRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i4.RouteConfig(BottomBarParent.name, path: '/bottomBar', children: [
          _i4.RouteConfig(BottomBarRoute.name,
              path: '', parent: BottomBarParent.name),
          _i4.RouteConfig(HomeScreenRoute.name,
              path: 'home-screen', parent: BottomBarParent.name),
          _i4.RouteConfig(ScreenOneRoute.name,
              path: 'screen-one', parent: BottomBarParent.name),
          _i4.RouteConfig(ScreenTwoRoute.name,
              path: 'screen-two', parent: BottomBarParent.name)
        ])
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(SplashRoute.name, path: '/', initialChildren: children);

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i4.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i4.PageRouteInfo>? children})
      : super(LoginScreenRoute.name,
            path: '/login-screen', initialChildren: children);

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreenRoute extends _i4.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i4.PageRouteInfo>? children})
      : super(RegisterScreenRoute.name,
            path: '/register-screen', initialChildren: children);

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class BottomBarParent extends _i4.PageRouteInfo<void> {
  const BottomBarParent({List<_i4.PageRouteInfo>? children})
      : super(BottomBarParent.name,
            path: '/bottomBar', initialChildren: children);

  static const String name = 'BottomBarParent';
}

/// generated route for
/// [_i5.BottomBar]
class BottomBarRoute extends _i4.PageRouteInfo<void> {
  const BottomBarRoute() : super(BottomBarRoute.name, path: '');

  static const String name = 'BottomBarRoute';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreenRoute extends _i4.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home-screen');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i7.ScreenOne]
class ScreenOneRoute extends _i4.PageRouteInfo<void> {
  const ScreenOneRoute() : super(ScreenOneRoute.name, path: 'screen-one');

  static const String name = 'ScreenOneRoute';
}

/// generated route for
/// [_i8.ScreenTwo]
class ScreenTwoRoute extends _i4.PageRouteInfo<void> {
  const ScreenTwoRoute() : super(ScreenTwoRoute.name, path: 'screen-two');

  static const String name = 'ScreenTwoRoute';
}
