import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spark/core/common/appConfig.dart';
import 'package:spark/core/model/profile.dart';
import 'package:spark/core/navigation/navigation_service.dart';
import 'package:spark/feature/account/presentation/screen/login_screen.dart';

part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(AppConfigState.initialState);

  Future<AppConfigState> applicationStarted() async {
    final profile = await _getUserProfile();
    return this.state.copyWith(
      isApplicationStarted: true,
      profile: profile,
    );
  }

  Future<AppConfigState> userLogout() async {
    AppConfig().deleteToken();
    Navigator.of(NavigationService.instance.navigatorKey.currentContext!).pushNamedAndRemoveUntil(LoginScreen.routeName,(Route<dynamic> route) => false);
    return this.state.clearProfile();
  }

  Future<AppConfigState> setUserProfile() async {
    return this.state.copyWith(profile: Profile(phoneConfirmed: false,name: "Yousef"));
  }

  Future<AppConfigState> verifyUserAccount() async {
    final profile = Profile(phoneConfirmed: false,name: "Yusuf");
    final newProfile = profile.copyWith(phoneConfirmed: true);
    return this.state.copyWith(profile: newProfile);
  }

  Future<Profile?> _getUserProfile() async {
    if (!await AppConfig().hasToken) return null;

    return Profile(phoneConfirmed: true);
  }

}
