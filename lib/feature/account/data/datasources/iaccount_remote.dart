import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';

import '../../../../core/result/result.dart';

abstract class IAccountRemoteSource {

  Future<MyResult<LoginModel>> login(LoginRequest loginRequest);

  Future<MyResult<RegisterModel>> register(
      RegisterRequest registerRequest);

}
