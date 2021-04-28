import 'package:spark/core/errors/base_error.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/core/usecases/usecase.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';

class LoginUseCase extends UseCase<LoginModel, LoginRequest>{
  final IAccountRepository accountRepository;

  LoginUseCase(this.accountRepository);
  @override
  Future<Result<BaseError, LoginModel>> call(LoginRequest params) async =>
      await accountRepository.login(params);
}