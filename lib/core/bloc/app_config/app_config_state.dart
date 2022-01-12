part of 'app_config_cubit.dart';

class AppConfigState {
  final AppStatus appStatus;

  // Current user profile.
  final Profile? profile;

  AppConfigState({
    required this.appStatus,
    this.profile,
  });

  AppConfigState copyWith({AppStatus? appStatus, Profile? profile}) =>
      AppConfigState(
          appStatus: appStatus ?? this.appStatus,
          profile: profile ?? this.profile,
      );

  AppConfigState clearProfile() {
    return AppConfigState(
      appStatus: AppStatus.UNAUTHORIZED,
      profile: null,
    );
  }

  factory AppConfigState.defaultState()=> AppConfigState(
    appStatus: AppStatus.NONE,
    profile: null,
  );
}
