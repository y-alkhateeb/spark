import 'package:dartz/dartz.dart';
import 'package:spark/core/constants/app/app_constants.dart';
import 'package:spark/core/datasource/shared_preference.dart';
import 'package:spark/core/errors/base_error.dart';
import 'package:spark/core/errors/unknown_error.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/datasources/iaccount_remote.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';

class AccountRepository extends IAccountRepository {
  final IAccountRemoteSource iAccountRemoteSource;

  AccountRepository(this.iAccountRemoteSource);


  @override
  Future<Result<BaseError, LoginModel>> login(LoginRequest loginRequest) async {
    final remote = await iAccountRemoteSource.login(loginRequest);
    if (remote.isLeft()) {
      return Result.error((remote as Left<BaseError, LoginModel>).value);
    }
    if (remote.isRight()) {
      final data = (remote as Right<BaseError, LoginModel>).value;
      // Persist token if exists.
      if (data.token != null && data.token!.isNotEmpty) {
        await persistToken(data.token!);
      }
      return Result.data(data);
    }
    else {
      return Result.error(UnknownError());
    }
  }

  @override
  Future<Result<BaseError, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    final remote = await iAccountRemoteSource.register(registerRequest);
    if(remote.isLeft()){
      return Result.error((remote as Left<BaseError, RegisterModel>).value);
    }
    if(remote.isRight()){
      return Result.data((remote as Right<BaseError, RegisterModel>).value);
    }
    else return Result.error(UnknownError());
  }

  /// deleteToken
  Future<void> deleteToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(ApplicationConstants.KEY_TOKEN);
    return;
  }

  /// deleteFcmToken
  Future<void> deleteFcmToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(ApplicationConstants.KEY_FIREBASE_TOKEN);
    return;
  }

  /// persistToken
  Future<void> persistToken(String token) async {
    final prefs = await SpUtil.getInstance();
    final tempToken1 = token.substring(0,13);
    final tempToken2 = token.substring(13);
    final reversedTempToken1 = tempToken1.split("").reversed.join();
    final reversedTempToken2 = tempToken2.split("").reversed.join();
    final newToken = ("$reversedTempToken2$reversedTempToken1");
    await prefs.putString(ApplicationConstants.KEY_TOKEN, newToken);
    return;
  }

  /// persistFcmToken
  Future<void> persistFcmToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(ApplicationConstants.KEY_FIREBASE_TOKEN, token);
    return;
  }


  /// read authToken
  static Future<String> get authToken async {
    final prefs = await SpUtil.getInstance();
    String? tempToken = prefs.getString(ApplicationConstants.KEY_TOKEN);
    final tempToken2 = tempToken!.substring(13,tempToken.length);
    final tempToken1 = tempToken.substring(0,13);
    final reversedTempToken1 = tempToken1.split("").reversed.join();
    final reversedTempToken2 = tempToken2.split("").reversed.join();
    final newToken = ("$reversedTempToken2$reversedTempToken1");
    return newToken;
  }

  /// read fcmToken
  static Future<String?> get fcmToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }


  /// check if hasToken or not
  static Future<bool> get hasToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_TOKEN);
    if (token != null) return true;
    return false;
  }

  /// check if hasFcmToken or not
  static Future<bool> get hasFcmToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }
}