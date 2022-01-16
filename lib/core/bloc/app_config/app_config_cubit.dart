import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spark/core/common/resource.dart';
import 'package:spark/core/constants/enums/app_status.dart';
import 'package:spark/core/datasource/shared_preference.dart';
import 'package:spark/core/datasource/sp_helper.dart';
import 'package:spark/core/model/profile.dart';
import 'package:spark/core/navigation/home_navigation_service.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';
import 'package:spark/feature/account/presentation/screen/login_screen.dart';

part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(AppConfigState.defaultState());

  applicationStarted() async {
    final profile = await _getUserProfile();
    if(await GetIt.I<IAccountRepository>().hasToken){
      emit(this.state.copyWith(
        appStatus: AppStatus.AUTHORIZED,
        profile: profile,
      ));
    }
    else emit(this.state.copyWith(
      appStatus: AppStatus.UNAUTHORIZED,
      profile: profile,
    ));
  }

  userLogout() async {
    SPHelper.deleteToken();
    Navigator.of(HomeNS().context).pushNamedAndRemoveUntil(LoginScreen.routeName,(Route<dynamic> route) => false);
    emit(this.state.clearProfile());
  }

  setUserProfile() async {
    emit(this.state.copyWith(profile:
    Profile(phoneConfirmed: false,name: "Yousef")));
  }

  verifyUserAccount() async {
    final profile = Profile(phoneConfirmed: false,name: "Yusuf");
    final newProfile = profile.copyWith(phoneConfirmed: true);
    emit(this.state.copyWith(profile: newProfile));
  }

  Future<Profile?> _getUserProfile() async {
    if (!await SPHelper.hasToken) return null;

    return Profile(phoneConfirmed: true);
  }




}
