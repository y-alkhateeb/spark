import 'package:spark/core/common/resource.dart';

import 'shared_preference.dart';

class SPHelper {
  /// deleteToken
  static void deleteToken() {
    final prefs = SpUtil.getInstance();
    prefs.remove(ApplicationConstants.KEY_TOKEN);
  }

  /// deleteFcmToken
  static void deleteFcmToken() {
    final prefs =SpUtil.getInstance();
    prefs.remove(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }

  /// persistToken
  static void persistToken(String token) {
    final prefs = SpUtil.getInstance();
    prefs.putString(ApplicationConstants.KEY_TOKEN, token);
  }

  /// persistFcmToken
  static void persistFcmToken(String token) {
    final prefs = SpUtil.getInstance();
    prefs.putString(ApplicationConstants.KEY_FIREBASE_TOKEN, token);
  }

  /// persist run tutorial
  static void persistRunTutorial(bool value) {
    final prefs = SpUtil.getInstance();
    prefs.putBool(ApplicationConstants.KEY_RUN_TUTORIAL, value);
  }

  static bool? get isRunTutorial{
    final prefs = SpUtil.getInstance();
    return prefs.getBool(ApplicationConstants.KEY_RUN_TUTORIAL);
  }

  /// read authToken
  /// if returns null that's means there no SP instance
  static String? get authToken {
    final prefs = SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_TOKEN);
  }

  /// read fcmToken
  /// if returns null that's means there no SP instance
  static String? get fcmToken {
    final prefs = SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }


  /// check if hasToken or not
  static bool get hasToken {
    final prefs = SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_TOKEN);
    if (token != null) return true;
    return false;
  }

  /// check if hasFcmToken or not
  static bool get hasFcmToken {
    final prefs = SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }
}