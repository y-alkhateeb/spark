// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i10;

import '../../feature/account/presentation/screen/login_screen.dart' as _i3;
import '../../feature/account/presentation/screen/otp_screen.dart' as _i5;
import '../../feature/account/presentation/screen/register_screen.dart' as _i4;
import '../../feature/home/screen/base_home_screen.dart' as _i8;
import '../../feature/home/screen/home_screen.dart' as _i9;
import '../../feature/home/screen/setting_screen.dart' as _i6;
import '../../feature/tutorial/tutorial_screen.dart' as _i2;
import '../../splash.dart' as _i1;
import 'base_route.dart' as _i11;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i1.SplashScreen());
    },
    TutorialScreenRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.TutorialScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.LoginScreen(),
          customRouteBuilder: _i11.myAnimatedRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    RegisterScreenRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.RegisterScreen(),
          customRouteBuilder: _i11.myAnimatedRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    OTPScreenRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.OTPScreen(),
          customRouteBuilder: _i11.myAnimatedRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SettingScreenRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.SettingScreen(),
          customRouteBuilder: _i11.myAnimatedRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    BottomBarParent.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    BottomBarRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i8.BaseHomeScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeScreen());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(SplashRoute.name, path: '/', children: [
          _i7.RouteConfig('*#redirect',
              path: '*',
              parent: SplashRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i7.RouteConfig(TutorialScreenRoute.name,
            path: '/tutorial-screen',
            children: [
              _i7.RouteConfig('*#redirect',
                  path: '*',
                  parent: TutorialScreenRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i7.RouteConfig(LoginScreenRoute.name,
            path: '/login-screen',
            children: [
              _i7.RouteConfig('*#redirect',
                  path: '*',
                  parent: LoginScreenRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i7.RouteConfig(RegisterScreenRoute.name,
            path: '/register-screen',
            children: [
              _i7.RouteConfig('*#redirect',
                  path: '*',
                  parent: RegisterScreenRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i7.RouteConfig(OTPScreenRoute.name, path: '/o-tp-screen', children: [
          _i7.RouteConfig('*#redirect',
              path: '*',
              parent: OTPScreenRoute.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i7.RouteConfig(SettingScreenRoute.name,
            path: '/setting-screen',
            children: [
              _i7.RouteConfig('*#redirect',
                  path: '*',
                  parent: SettingScreenRoute.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i7.RouteConfig(BottomBarParent.name, path: '/bottomBar', children: [
          _i7.RouteConfig(BottomBarRoute.name,
              path: '', parent: BottomBarParent.name),
          _i7.RouteConfig(HomeScreenRoute.name,
              path: 'home-screen', parent: BottomBarParent.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(SplashRoute.name, path: '/', initialChildren: children);

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.TutorialScreen]
class TutorialScreenRoute extends _i7.PageRouteInfo<void> {
  const TutorialScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(TutorialScreenRoute.name,
            path: '/tutorial-screen', initialChildren: children);

  static const String name = 'TutorialScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(LoginScreenRoute.name,
            path: '/login-screen', initialChildren: children);

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterScreenRoute extends _i7.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(RegisterScreenRoute.name,
            path: '/register-screen', initialChildren: children);

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i5.OTPScreen]
class OTPScreenRoute extends _i7.PageRouteInfo<void> {
  const OTPScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(OTPScreenRoute.name,
            path: '/o-tp-screen', initialChildren: children);

  static const String name = 'OTPScreenRoute';
}

/// generated route for
/// [_i6.SettingScreen]
class SettingScreenRoute extends _i7.PageRouteInfo<void> {
  const SettingScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(SettingScreenRoute.name,
            path: '/setting-screen', initialChildren: children);

  static const String name = 'SettingScreenRoute';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class BottomBarParent extends _i7.PageRouteInfo<void> {
  const BottomBarParent({List<_i7.PageRouteInfo>? children})
      : super(BottomBarParent.name,
            path: '/bottomBar', initialChildren: children);

  static const String name = 'BottomBarParent';
}

/// generated route for
/// [_i8.BaseHomeScreen]
class BottomBarRoute extends _i7.PageRouteInfo<void> {
  const BottomBarRoute() : super(BottomBarRoute.name, path: '');

  static const String name = 'BottomBarRoute';
}

/// generated route for
/// [_i9.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home-screen');

  static const String name = 'HomeScreenRoute';
}
