import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/datasources/iaccount_remote.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';

import '../../../../core/datasource/isp_helper.dart';

@Injectable(as: IAccountRepository)
class AccountRepository implements IAccountRepository{
  final IAccountRemoteSource iAccountRemoteSource;

  AccountRepository(this.iAccountRemoteSource);


  @override
  Future<MyResult<LoginModel>> login(LoginRequest loginRequest) async {
    final remote = await iAccountRemoteSource.login(loginRequest);
    remote.whenOrNull(
      isSuccess: (data){
        if (data!.token != null && data.token!.isNotEmpty) {
          GetIt.I<ISpHelper>().writeToken(data.token!);
        }
      }
    );
    return remote;
  }

  @override
  Future<MyResult<RegisterModel>> register(
      RegisterRequest registerRequest) async {
    return await iAccountRemoteSource.register(registerRequest);
  }
}