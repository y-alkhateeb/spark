import 'package:flutter/material.dart';

import 'INavigationService.dart';

/// [Navi] = [NavigationService]
class Navi implements INavigationService {
  static final Navi _instance = Navi._init();

  Navi._init();

  factory Navi() {
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
  void goBack(BuildContext context) {
    unFocus();
    Navigator.pop(context);
  }

  @override
  void unFocus() {
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }
}