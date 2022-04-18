import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:spark/core/bloc/base_state/base_state.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';

part 'user_account_state.dart';

class AccountLoginCubit extends Cubit<AccountLoginState> {
  AccountLoginCubit() : super(AccountLoginState.defaultState());

  void loginAccount(LoginRequest loginRequest) async {
    AccountLoginState _state = this.state.copyWith(
          accountLoadingState: BaseState.loading(),
        );
    emit(_state);
    final data = await GetIt.I<IAccountRepository>().login(LoginRequest(
      cancelToken: loginRequest.cancelToken,
      phoneNumber: loginRequest.phoneNumber,
      email: loginRequest.email,
      password: loginRequest.password,
    ));

    data.when(
        isSuccess: (data) {
          _state =
              this.state.copyWith(accountLoadingState: BaseState.success(data));
        },
        isError: (error) {
          _state = this.state.copyWith(
                  accountLoadingState: BaseState.failure(error, () {
                this.loginAccount(loginRequest);
              }));
        },
    );
    emit(_state);
  }

}
