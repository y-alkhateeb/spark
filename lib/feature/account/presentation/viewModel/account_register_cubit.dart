import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:spark/core/bloc/base_state/base_state.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';
import 'package:spark/feature/account/domain/usecase/register_usecase.dart';

part 'account_register_state.dart';

class AccountRegisterCubit extends Cubit<AccountRegisterState> {
  AccountRegisterCubit() : super(AccountRegisterState.defaultState());

  void registerAccount(RegisterRequest registerRequest) async{
    AccountRegisterState _state = this.state.copyWith(
    accountRegisterState: BaseState.loading(),
    );
    emit(_state);
    final data = await RegisterUseCase(GetIt.I<IAccountRepository>())(
        RegisterRequest(
          firstName: registerRequest.firstName,
          lastName: registerRequest.lastName,
          cancelToken: registerRequest.cancelToken,
          phoneNumber: registerRequest.phoneNumber,
          email: registerRequest.email,
          password: registerRequest.password,
        )
    );

    data.pick(
        onData: (data){
          _state = this.state.copyWith(
              accountRegisterState: BaseState.success(data),
          );
        },
        onError: (error) {
          _state = this.state.copyWith(
            accountRegisterState: BaseState.failure(error, () {
              this.registerAccount(registerRequest);
            })
          );
        },
        onErrorWithData: (data, error){
        }
    );
    emit(_state);
  }

}