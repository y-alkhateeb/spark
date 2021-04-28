part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
}

class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}

/// Login
class LoginAccountWaiting extends AccountState {
  const LoginAccountWaiting();
  @override
  List<Object> get props => [];
}
class LoginAccountSuccess extends AccountState {
  const LoginAccountSuccess();
  @override
  List<Object> get props => [];
}
class LoginAccountConfirmFailure extends AccountState {
  final BaseError error;
  final VoidCallback callback;

  const LoginAccountConfirmFailure(this.error, this.callback);
  @override
  List<Object> get props => [];
}
class LoginAccountGeneralFailure extends AccountState {
  final BaseError error;
  final VoidCallback callback;

  const LoginAccountGeneralFailure(this.error, this.callback);
  @override
  List<Object> get props => [error,callback];
}

/// Register
class RegisterAccountWaiting extends AccountState {
  const RegisterAccountWaiting();
  @override
  List<Object> get props => [];
}
class RegisterAccountSuccess extends AccountState {
  const RegisterAccountSuccess();
  @override
  List<Object> get props => [];
}
class RegisterAccountConfirmFailure extends AccountState {
  final BaseError error;
  final VoidCallback callback;

  const RegisterAccountConfirmFailure(this.error, this.callback);
  @override
  List<Object> get props => [];
}
class RegisterAccountGeneralFailure extends AccountState {
  final BaseError error;
  final VoidCallback callback;

  const RegisterAccountGeneralFailure(this.error, this.callback);
  @override
  List<Object> get props => [error,callback];
}
