part of 'user_account_cubit.dart';

@immutable
class AccountLoginState {
  final BaseState<LoginModel> accountLoggingState;

  const AccountLoginState({
    required this.accountLoggingState,
  });

  AccountLoginState copyWith({
    BaseState<LoginModel>? accountLoadingState,
  }) =>
      AccountLoginState(
        accountLoggingState: accountLoadingState ?? this.accountLoggingState,
      );

  factory AccountLoginState.defaultState() => AccountLoginState(
        accountLoggingState: BaseState.init(),
      );
}
