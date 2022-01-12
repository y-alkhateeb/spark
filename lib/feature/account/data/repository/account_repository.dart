import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/bloc/app_config/app_config_cubit.dart';
import 'package:spark/core/errors/base_error.dart';
import 'package:spark/core/errors/unknown_error.dart';
import 'package:spark/core/navigation/navigation_service.dart';
import 'package:spark/core/repository/Repository.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/datasources/iaccount_remote.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';

class AccountRepository with Repository implements IAccountRepository{
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
        await Navi().context.read<AppConfigCubit>().
        persistToken(data.token!);
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