// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TRY AGAIN`
  String get btn_Rty_title {
    return Intl.message(
      'TRY AGAIN',
      name: 'btn_Rty_title',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error happened`
  String get error_unknown_happened {
    return Intl.message(
      'Unknown error happened',
      name: 'error_unknown_happened',
      desc: '',
      args: [],
    );
  }

  /// `INTERNAL SERVER ERROR`
  String get error_internal_server {
    return Intl.message(
      'INTERNAL SERVER ERROR',
      name: 'error_internal_server',
      desc: '',
      args: [],
    );
  }

  /// `BAD REQUEST`
  String get error_BadRequest_Error {
    return Intl.message(
      'BAD REQUEST',
      name: 'error_BadRequest_Error',
      desc: '',
      args: [],
    );
  }

  /// `PAGE NOT FOUND`
  String get error_NotFound_Error {
    return Intl.message(
      'PAGE NOT FOUND',
      name: 'error_NotFound_Error',
      desc: '',
      args: [],
    );
  }

  /// `TIME OUT`
  String get error_Timeout_Error {
    return Intl.message(
      'TIME OUT',
      name: 'error_Timeout_Error',
      desc: '',
      args: [],
    );
  }

  /// `AN UNEXPECTED ERROR OCCURRED`
  String get error_general {
    return Intl.message(
      'AN UNEXPECTED ERROR OCCURRED',
      name: 'error_general',
      desc: '',
      args: [],
    );
  }

  /// `UNAUTHORIZED`
  String get error_Unauthorized_Error {
    return Intl.message(
      'UNAUTHORIZED',
      name: 'error_Unauthorized_Error',
      desc: '',
      args: [],
    );
  }

  /// `YOU DO NOT HAVE PRIVILEGE`
  String get error_forbidden_error {
    return Intl.message(
      'YOU DO NOT HAVE PRIVILEGE',
      name: 'error_forbidden_error',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during the connection`
  String get error_connection {
    return Intl.message(
      'An error occurred during the connection',
      name: 'error_connection',
      desc: '',
      args: [],
    );
  }

  /// `Connection error`
  String get error_connection_lost {
    return Intl.message(
      'Connection error',
      name: 'error_connection_lost',
      desc: '',
      args: [],
    );
  }

  /// `The connection is interrupted`
  String get error_cancel_token {
    return Intl.message(
      'The connection is interrupted',
      name: 'error_cancel_token',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone`
  String get error_inValid_phone {
    return Intl.message(
      'Invalid phone',
      name: 'error_inValid_phone',
      desc: '',
      args: [],
    );
  }

  /// `InValid email`
  String get error_inValid_email {
    return Intl.message(
      'InValid email',
      name: 'error_inValid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password short`
  String get error_password_short {
    return Intl.message(
      'Password short',
      name: 'error_password_short',
      desc: '',
      args: [],
    );
  }

  /// `inValid name`
  String get error_inValid_name {
    return Intl.message(
      'inValid name',
      name: 'error_inValid_name',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get error_confirm_password {
    return Intl.message(
      'Passwords do not match',
      name: 'error_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get error_socket {
    return Intl.message(
      'No internet connection',
      name: 'error_socket',
      desc: '',
      args: [],
    );
  }

  /// `Conflict error`
  String get error_conflict {
    return Intl.message(
      'Conflict error',
      name: 'error_conflict',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get app_cancel {
    return Intl.message(
      'Cancel',
      name: 'app_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get app_confirm {
    return Intl.message(
      'Confirm',
      name: 'app_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get label_logout {
    return Intl.message(
      'Logout',
      name: 'label_logout',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get label_change_language {
    return Intl.message(
      'Change language',
      name: 'label_change_language',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get label_Login {
    return Intl.message(
      'Login',
      name: 'label_Login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get label_register {
    return Intl.message(
      'Register',
      name: 'label_register',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get label_forget_pass {
    return Intl.message(
      'Forget password?',
      name: 'label_forget_pass',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get label_phone {
    return Intl.message(
      'Phone',
      name: 'label_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get label_email {
    return Intl.message(
      'Email',
      name: 'label_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get label_password {
    return Intl.message(
      'Password',
      name: 'label_password',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get label_full_name {
    return Intl.message(
      'Full name',
      name: 'label_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get label_confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'label_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Birth date`
  String get label_birthdate {
    return Intl.message(
      'Birth date',
      name: 'label_birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Change theme`
  String get label_change_theme {
    return Intl.message(
      'Change theme',
      name: 'label_change_theme',
      desc: '',
      args: [],
    );
  }

  /// `I agree to terms of use.`
  String get label_terms_of_use {
    return Intl.message(
      'I agree to terms of use.',
      name: 'label_terms_of_use',
      desc: '',
      args: [],
    );
  }

  /// `Registered already? Login`
  String get label_registered_already {
    return Intl.message(
      'Registered already? Login',
      name: 'label_registered_already',
      desc: '',
      args: [],
    );
  }

  /// `pick`
  String get pick {
    return Intl.message(
      'pick',
      name: 'pick',
      desc: '',
      args: [],
    );
  }

  /// `camera`
  String get camera {
    return Intl.message(
      'camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Phone verification`
  String get phone_verification {
    return Intl.message(
      'Phone verification',
      name: 'phone_verification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your 5 digit pin sent on your registered mobile number`
  String get please_enter_ur4digit {
    return Intl.message(
      'Please enter your 5 digit pin sent on your registered mobile number',
      name: 'please_enter_ur4digit',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get label_profile {
    return Intl.message(
      'Profile',
      name: 'label_profile',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get label_services {
    return Intl.message(
      'Services',
      name: 'label_services',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get label_notifications {
    return Intl.message(
      'Notifications',
      name: 'label_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get label_chat {
    return Intl.message(
      'Chats',
      name: 'label_chat',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get label_setting {
    return Intl.message(
      'Settings',
      name: 'label_setting',
      desc: '',
      args: [],
    );
  }

  /// `Skip this tour`
  String get label_skip_tour {
    return Intl.message(
      'Skip this tour',
      name: 'label_skip_tour',
      desc: '',
      args: [],
    );
  }

  /// `Start exploring`
  String get start_exploring {
    return Intl.message(
      'Start exploring',
      name: 'start_exploring',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
