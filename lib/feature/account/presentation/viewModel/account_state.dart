part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
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
    loginAccountWaiting: AccountWaiting()
  );

  @override
  List<Object?> get props => [
        loginAccountWaiting,
        loginAccountFailure,
        loginModel,
      ];
}

/// Register
class RegisterAccountWaiting extends AccountState {
   RegisterAccountWaiting();

  @override
  List<Object> get props => [];
}

class RegisterAccountSuccess extends AccountState {
   RegisterAccountSuccess();

  @override
  List<Object> get props => [];
}

class RegisterAccountConfirmFailure extends AccountState {
  final BaseError error;
  final VoidCallback callback;

   RegisterAccountConfirmFailure(this.error, this.callback);

  @override
  List<Object> get props => [];
}

class RegisterAccountGeneralFailure extends AccountState {
  final BaseError error;
  final VoidCallback callback;

   RegisterAccountGeneralFailure(this.error, this.callback);

  @override
  List<Object> get props => [error, callback];
}
