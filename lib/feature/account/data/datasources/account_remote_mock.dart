import 'package:spark/core/constants/app/app_constants.dart';
import 'package:spark/core/datasource/shared_preference.dart';
import 'package:spark/core/errors/custom_error.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';

import 'iaccount_remote.dart';

class AccountRemoteSource extends IAccountRemoteSource {

  @override
  Future<Result<LoginModel>> login(LoginRequest loginRequest) async {
    await Future.delayed(Duration(seconds: 2));
    if(loginRequest.phoneNumber == "0950404087" &&
        loginRequest.password == "12345678"){
      return Result.isSuccess(
          LoginModel(
              account: Account(
                  name: 'Yousef Alkhateeb',
                  id: "1",
                  imageUrl: "",
              ),
              token: "token123"),
      );
    }
    else return Result.isError(CustomError(message: "Phone or password is wrong."));
  }


  @override
  Future<Result<RegisterModel>> register(
      RegisterRequest registerRequest) async {
    return Result.isError(CustomError(message: "Phone or password is wrong."));
  }


  @override
  /// deleteToken
  Future<void> deleteToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(ApplicationConstants.KEY_TOKEN);
  }

  @override
  /// deleteFcmToken
  Future<void> deleteFcmToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }

  @override
  /// persistToken
  Future<void> persistToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(ApplicationConstants.KEY_TOKEN, token);
  }

  @override
  /// persistFcmToken
  Future<void> persistFcmToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(ApplicationConstants.KEY_FIREBASE_TOKEN, token);
  }

  @override
  /// read authToken
  /// if returns null that's means there no SP instance
  Future<String?> get authToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_TOKEN);
  }


  @override
  /// read fcmToken
  /// if returns null that's means there no SP instance
  Future<String?> get fcmToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }


  @override
  /// check if hasToken or not
  Future<bool> get hasToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_TOKEN);
    if (token != null) return true;
    return false;
  }

  @override
  /// check if hasFcmToken or not
  Future<bool> get hasFcmToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }

}