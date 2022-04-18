import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../datasource/isp_helper.dart';
import '../navigation/base_route.gr.dart';


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

userLogout() async {
  var prefs = GetIt.I<ISpHelper>();
  prefs.deleteToken();
  GetIt.I<AppRouter>().navigatorKey.currentContext!.router.pushAndPopUntil(LoginScreenRoute(), predicate: (Route<dynamic> route) => false,);
}

// class Camera {
//   static Future<String> openCamera() async {
//     final image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 15);
//
//     List<int> base64Byte = image.readAsBytesSync();
//     String base64Encoded = base64Encode(base64Byte);
//
//     return "data:image/png;base64," + base64Encoded;
//   }
//
//   static Future<String> openGallery({ bool getBase64 = true }) async {
//     final image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 15);
//
//     List<int> base64Byte = image.readAsBytesSync();
//     String base64Encoded = base64Encode(base64Byte);
//
//     return base64Encoded;
//   }
//
//   static Uint8List base64ToFile(String image) => base64.decode(image);
// }