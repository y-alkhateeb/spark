import 'package:spark/core/errors/base_error.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/core/usecases/usecase.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';

class RegisterUseCase extends UseCase<RegisterModel, RegisterRequest>{
  final IAccountRepository accountRepository;

  RegisterUseCase(this.accountRepository);
  @override
  Future<Result<BaseError, RegisterModel>> call(RegisterRequest params) async =>
      await accountRepository.register(params);
}