abstract class ISpHelper{
  /// deleteToken
  Future<void> deleteToken();

  /// deleteFcmToken
  Future<void> deleteFcmToken();

  /// persistToken
  Future<void> writeToken(String token);

  /// persistFcmToken
  Future<void> writeFcmToken(String token);

  /// should be set true after the first time run the app
  Future<void> writeRunTutorial(bool value);

  /// if null or false user can show the tutorial
  Future<bool?> get isRunTutorial;

  /// read authToken
  /// if returns null that's means there no SP instance
  Future<String?> get authToken;

  /// read fcmToken
  /// if returns null that's means there no SP instance
  Future<String?> get fcmToken;


  /// check if hasToken or not
  Future<bool> get hasToken;

  /// check if hasFcmToken or not
  Future<bool> get hasFcmToken;

  /// should be set true after the first time run the app
  Future<void> writeFirstRunApp(bool value);

  /// if null or false so user first time run the app
  Future<bool?> get isNotFirstRunApp;


  /// write the application language in shared preferences
  Future<void> writeAppLang(String value);

  /// get the application language from shared preferences
  Future<String?> get readAppLang;

}