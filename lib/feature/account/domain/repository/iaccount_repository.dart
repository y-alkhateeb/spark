import 'package:spark/core/errors/base_error.dart';
import 'package:spark/core/repository/Repository.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';

abstract class IAccountRepository extends Repository{
  Future<Result<BaseError, LoginModel>> login(LoginRequest loginRequest);

  Future<Result<BaseError, RegisterModel>> register(
      RegisterRequest registerRequest);

}
