import 'package:get_it/get_it.dart';
import 'package:spark/core/constants/app/app_constants.dart';
import 'package:spark/core/datasource/shared_preference.dart';
import 'package:spark/core/errors/base_error.dart';
import 'package:spark/core/constants/enums/http_method.dart';
import 'package:spark/core/net/api_url.dart';
import 'package:spark/core/net/http_client.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';

import '../../../../core/result/result.dart';
import 'iaccount_remote.dart';

class AccountRemoteSource extends IAccountRemoteSource{

  @override
  Future<Result<BaseError, LoginModel>> login(LoginRequest loginRequest) async {
    return await GetIt.I<HttpClient>().requestMapResponse<LoginModel>(
      converter: (json) => LoginModel.fromMap(json),
      method: HttpMethod.POST,
      url: LOGIN_URL,
      body: loginRequest.toMap(),
      cancelToken: loginRequest.cancelToken,
    );
  }


  @override
  Future<Result<BaseError, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    return await GetIt.I<HttpClient>().requestMapResponse<RegisterModel>(
      converter: (json) => RegisterModel.fromMap(json),
      method: HttpMethod.POST,
      url: "ACCOUNT_REGISTER",
      body: registerRequest.toMap(),
      cancelToken: registerRequest.cancelToken,
    );
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