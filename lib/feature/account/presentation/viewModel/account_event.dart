part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
}

class LoginAccountEvent extends AccountEvent {
  final LoginRequest loginRequest;

  const LoginAccountEvent(this.loginRequest);

  @override
  List<Object> get props => [loginRequest];
}

class RegisterAccountEvent extends AccountEvent {
  final RegisterRequest registerRequest;

  const RegisterAccountEvent(this.registerRequest);

  @override
  List<Object> get props => [registerRequest];
}
