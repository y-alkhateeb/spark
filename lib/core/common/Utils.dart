import 'package:flutter/material.dart';
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

// logout() async {
//   if (await AccountRepository.hasToken){
//     await GetIt.I<AccountRepository>().deleteToken();
//     Navigator.of(NavigationService.instance.navigatorKey.currentContext!).pushNamedAndRemoveUntil(LoginScreen.routeName,(Route<dynamic> route) => false);
//   }
// }

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