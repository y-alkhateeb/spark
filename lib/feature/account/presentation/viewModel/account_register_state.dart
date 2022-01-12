part of 'account_register_cubit.dart';

@immutable
class AccountRegisterState{
  final BaseState<RegisterModel> accountRegisterState;

  const AccountRegisterState({
    required this.accountRegisterState,
  });

  AccountRegisterState copyWith({
    BaseState<RegisterModel>? accountRegisterState,
  }) =>
      AccountRegisterState(
          accountRegisterState:
          accountRegisterState ?? this.accountRegisterState);


  factory AccountRegisterState.defaultState() => AccountRegisterState(
    accountRegisterState: BaseState.init(),
  );
}