import 'package:flutter/material.dart';
import 'package:spark/app.dart';
import 'package:spark/core/navigation/INavigationService.dart';
import 'package:spark/core/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';
import '../../feature/account/data/repository/account_repository.dart';
import '../../feature/account/presentation/screen/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';


/// This function for move cursor from A to B
/// and will be take 3 parameter
/// [context] to know which screen we are
/// [currentFocus] where are you now ? which text form field
/// [nextFocus] where will be when called this function
fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
/// This for unFocus nodes
unFocusList({required List<FocusNode> focus}){
  focus.forEach((element) {element.unfocus();});
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

logout() async {
  if (await AccountRepository.hasToken){
    await GetIt.I<AccountRepository>().deleteToken();
    Navigator.of(NavigationService.instance.navigatorKey.currentContext!).pushNamedAndRemoveUntil(LoginScreen.routeName,(Route<dynamic> route) => false);
  }
}