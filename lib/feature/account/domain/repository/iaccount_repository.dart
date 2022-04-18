import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';

abstract class IAccountRepository{
  Future<MyResult<LoginModel>> login(LoginRequest loginRequest);

  Future<MyResult<RegisterModel>> register(
      RegisterRequest registerRequest);

}
