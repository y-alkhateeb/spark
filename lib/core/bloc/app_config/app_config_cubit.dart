import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spark/core/common/resource.dart';
import 'package:spark/core/constants/enums/app_status.dart';
import 'package:spark/core/datasource/shared_preference.dart';
import 'package:spark/core/model/profile.dart';
import 'package:spark/core/navigation/navigation_service.dart';
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
    deleteToken();
    Navigator.of(Navi().context).pushNamedAndRemoveUntil(LoginScreen.routeName,(Route<dynamic> route) => false);
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
    if (!await hasToken) return null;

    return Profile(phoneConfirmed: true);
  }



  /// deleteToken
  Future<void> deleteToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(ApplicationConstants.KEY_TOKEN);
  }

  /// deleteFcmToken
  Future<void> deleteFcmToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }

  /// persistToken
  Future<void> persistToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(ApplicationConstants.KEY_TOKEN, token);
  }

  /// persistFcmToken
  Future<void> persistFcmToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(ApplicationConstants.KEY_FIREBASE_TOKEN, token);
  }


  /// read authToken
  /// if returns null that's means there no SP instance
  Future<String?> get authToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_TOKEN);
  }

  /// read fcmToken
  /// if returns null that's means there no SP instance
  Future<String?> get fcmToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
  }


  /// check if hasToken or not
  Future<bool> get hasToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_TOKEN);
    if (token != null) return true;
    return false;
  }

  /// check if hasFcmToken or not
  Future<bool> get hasFcmToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(ApplicationConstants.KEY_FIREBASE_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }
}
