import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateToPage({required String path, Object? data});

  Future<void> navigateToPageClear({required String path, Object? data});

  void goBack(BuildContext context);

  void unFocus();
}
