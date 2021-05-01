part of 'account_bloc.dart';

abstract class AccountState {
  const AccountState();
}

class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountWaiting extends AccountState {
  AccountWaiting();

  @override
  List<Object> get props => [];
}

class AccountFailure extends AccountState {
  final BaseError error;
  final VoidCallback callback;

  AccountFailure(this.error, this.callback);

  @override
  List<Object> get props => [error, callback];
}

/// Login
class LoginAccountState extends AccountState {
  final AccountWaiting? loginAccountWaiting;
  final AccountFailure? loginAccountFailure;
  final LoginModel? loginModel;

  LoginAccountState({
    this.loginAccountWaiting,
    this.loginAccountFailure,
    this.loginModel,
  });

  LoginAccountState copyWith({
    AccountWaiting? loginAccountWaiting,
    AccountFailure? loginAccountFailure,
    LoginModel? loginModel,
  }) =>
      LoginAccountState(
          loginAccountWaiting: loginAccountWaiting ?? this.loginAccountWaiting,
          loginAccountFailure: loginAccountFailure ?? this.loginAccountFailure,
          loginModel: loginModel ?? this.loginModel);

  LoginAccountState get waiting => LoginAccountState(
      loginModel: null,
      loginAccountFailure: null,
      loginAccountWaiting: AccountWaiting());

}

/// Register
class RegisterAccountState extends AccountState {
  final AccountWaiting? registerAccountWaiting;
  final AccountFailure? registerAccountFailure;
  final RegisterModel? registerModel;

  RegisterAccountState({
    this.registerAccountWaiting,
    this.registerAccountFailure,
    this.registerModel,
  });

  RegisterAccountState copyWith({
    AccountWaiting? registerAccountWaiting,
    AccountFailure? registerAccountFailure,
    RegisterModel? registerModel,
  }) =>
      RegisterAccountState(
          registerAccountWaiting: registerAccountWaiting ?? this.registerAccountWaiting,
          registerAccountFailure: registerAccountFailure ?? this.registerAccountFailure,
          registerModel: registerModel ?? this.registerModel);

  RegisterAccountState get waiting => RegisterAccountState(
      registerModel: null,
      registerAccountFailure: null,
      registerAccountWaiting: AccountWaiting());

}
