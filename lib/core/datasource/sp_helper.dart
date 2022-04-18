import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spark/core/common/resource.dart';

import 'isp_helper.dart';

@Injectable(as: ISpHelper)
class SPHelper implements ISpHelper{

  @override
  /// deleteToken
  Future<void> deleteToken() async {
    final prefs = GetIt.I<SharedPreferences>();
    await prefs.remove(ApplicationConstants.KEY_TOKEN);
  }

  @override
  /// deleteFcmToken
  Future<void> deleteFcmToken() async {
    final prefs = GetIt.I<SharedPreferences>();
    await prefs.remove(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }

  @override
  /// persistToken
  Future<void> writeToken(String token) async {
    final prefs = GetIt.I<SharedPreferences>();
    await prefs.setString(ApplicationConstants.KEY_TOKEN, token);
  }

  @override
  /// persistFcmToken
  Future<void> writeFcmToken(String token) async {
    final prefs = GetIt.I<SharedPreferences>();
    await prefs.setString(ApplicationConstants.KEY_FIREBASE_TOKEN, token);
  }

  @override
  /// persist run tutorial
  Future<void> writeRunTutorial(bool value) async {
    final prefs = GetIt.I<SharedPreferences>();
    await prefs.setBool(ApplicationConstants.KEY_RUN_TUTORIAL, value);
  }

  @override
  Future<bool?> get isRunTutorial async {
    final prefs = GetIt.I<SharedPreferences>();
    return await prefs.getBool(ApplicationConstants.KEY_RUN_TUTORIAL);
  }


  @override
  /// read authToken
  /// if returns null that's means there no SP instance
  Future<String?> get authToken async {
    final prefs = GetIt.I<SharedPreferences>();
    return await prefs.getString(ApplicationConstants.KEY_TOKEN);
  }

  @override
  /// read fcmToken
  /// if returns null that's means there no SP instance
  Future<String?> get fcmToken async {
    final prefs = GetIt.I<SharedPreferences>();
    return await prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }


  @override
  /// check if hasToken or not
  Future<bool> get hasToken async {
    final prefs = GetIt.I<SharedPreferences>();
    String? token = await prefs.getString(ApplicationConstants.KEY_TOKEN);
    if (token != null) return true;
    return false;
  }

  @override
  /// check if hasFcmToken or not
  Future<bool> get hasFcmToken async {
    final prefs = GetIt.I<SharedPreferences>();
    String? token = await prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }

  @override
  Future<void> writeFirstRunApp(bool value) async {
    final prefs = GetIt.I<SharedPreferences>();
    await prefs.setBool(ApplicationConstants.KEY_FIRST_START, value);
  }

  @override
  Future<bool> get isNotFirstRunApp async {
    final prefs = GetIt.I<SharedPreferences>();
    var result = await prefs.getBool(ApplicationConstants.KEY_FIRST_START);
    if(result == null) return false;
    return result;
  }


  @override
  Future<void> writeAppLang(String value) async{
    final prefs = GetIt.I<SharedPreferences>();
    await prefs.setString(ApplicationConstants.KEY_LANGUAGE, value);
  }

  @override
  Future<String?> get readAppLang async => GetIt.I<SharedPreferences>().getString(ApplicationConstants.KEY_LANGUAGE);
}