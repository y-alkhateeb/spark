import 'package:get_it/get_it.dart';

import '../../../generated/l10n.dart';
import '../../navigation/base_route.gr.dart';

extension Validator on String {

  String? noValidate() {
    return null;
  }

  String? validateEmpty({String? message}) {
    if (trim().isEmpty) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).fillField;
    }
    return null;
  }

  String? validateName({String? message}) {
    if (trim().isEmpty) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).fillField;
    }else if(length<8 || length>30){
      return  message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).nameValidation;
    }
    return null;
  }


  String? validateAddress({String? message}) {
    if (trim().isEmpty) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).fillField;
    }else if(length<5 || length>100){
      return  message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).nameValidation;
    }
    return null;
  }

  String? validatePassword({String? message}) {
    if (trim().isEmpty) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).fillField;
    } else if (!RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this)) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).passValidation;
    }
    return null;
  }

  String? validateEmail({String? message}) {
    if (trim().isEmpty) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).fillField;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this)) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).mailValidation;
    }
    return null;
  }

  String? validateEmailORNull({String? message}) {
    if (trim().isNotEmpty) {
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this)) {
        return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).mailValidation;
      }
    }
    return null;
  }

  String? validatePhone({String? message}) {
    if (trim().isEmpty) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).fillField;
    } else if (!RegExp(
        r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
        .hasMatch(this) ||
        length < 10) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).phoneValidation;
    }
    return null;
  }

  String? validatePhoneOrNull({String? message}) {
    if (trim().isEmpty) {
      return null;
    } else if (!RegExp(
        r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
        .hasMatch(this) ||
        length < 10) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).phoneValidation;
    }
    return null;
  }

  String? validatePasswordConfirm({required String pass, String? message}) {
    if (trim().isEmpty) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).fillField;
    } else if (this != pass) {
      return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).confirmValidation;
    }
    return null;
  }
}

String? validateDropDown( dynamic model,{String? message}) {
  if (model == null) {
    return message ?? S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).fillField;
  }
  return null;
}
