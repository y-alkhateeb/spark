import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';

import '../../../../core/result/result.dart';

abstract class IAccountRemoteSource {

  Future<MyResult<LoginModel>> login(LoginRequest loginRequest);

  Future<MyResult<RegisterModel>> register(
      RegisterRequest registerRequest);



  /// deleteToken
  Future<void> deleteToken();

  /// deleteFcmToken
  Future<void> deleteFcmToken();

  /// persistToken
  Future<void> persistToken(String token);

  /// persistFcmToken
  Future<void> persistFcmToken(String token);


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
}
