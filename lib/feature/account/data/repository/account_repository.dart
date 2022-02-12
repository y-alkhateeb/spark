import 'package:spark/core/datasource/sp_helper.dart';
import 'package:spark/core/errors/base_error.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/datasources/iaccount_remote.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';

class AccountRepository implements IAccountRepository{
  final IAccountRemoteSource iAccountRemoteSource;

  AccountRepository(this.iAccountRemoteSource);


  @override
  Future<Result<BaseError, LoginModel>> login(LoginRequest loginRequest) async {
    final remote = await iAccountRemoteSource.login(loginRequest);
    if (remote.hasDataOnly) {
      // Persist token if exists.
      if (remote.data!.token != null && remote.data!.token!.isNotEmpty) {
        SPHelper.persistToken(remote.data!.token!);
      }
    }
    return remote;
  }

  @override
  Future<Result<BaseError, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    return await iAccountRemoteSource.register(registerRequest);
  }

  @override
  Future<String?> get authToken async => iAccountRemoteSource.authToken;

  @override
  Future<void> deleteFcmToken() async {
    iAccountRemoteSource.deleteFcmToken();
  }

  @override
  Future<void> deleteToken() async{
    iAccountRemoteSource.deleteToken();
  }

  @override
  Future<String?> get fcmToken async=> iAccountRemoteSource.fcmToken;

  @override
  Future<bool> get hasFcmToken async=> iAccountRemoteSource.hasFcmToken;

  @override
  Future<bool> get hasToken async=> hasToken;

  @override
  Future<void> persistFcmToken(String token) async{
    iAccountRemoteSource.persistFcmToken(token);
  }

  @override
  Future<void> persistToken(String token) async{
    iAccountRemoteSource.persistToken(token);
  }
}