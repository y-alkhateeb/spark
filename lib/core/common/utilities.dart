import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocode/geocode.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../datasource/isp_helper.dart';
import '../navigation/base_route.gr.dart';
import 'custom_toast.dart';

@injectable
class Utilities {
  copyToClipBoard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((value) {
      CustomToast.showSnakeBar("Copied successfully", type: ToastType.success);
    });
  }


  Future<PermissionStatus> getContactsPermission() async {
    await Permission.contacts.request();
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.granted;
    } else {
      return permission;
    }
  }


  String customizePhoneNumber(String phone, String? code) {
    String phoneNumber = "";
    if (phone.startsWith("0")) {
      phoneNumber = phone.replaceFirst("0", code ?? "+20");
    } else {
      phoneNumber = "${(code ?? "+20") }$phone";
    }
    return phoneNumber;
  }


  Future<File?> getImageFile(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      File imageFile = File(result.files.single.path!);
      return imageFile;
    }
    return null;
  }

  Future<File?> getAttachmentFile(FileType fileType) async {
    if(fileType == FileType.any){
      return await getAPdfFile();
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowMultiple: false,
    );
    if (result != null) {
      File imageFile = File(result.files.single.path!);
      return imageFile;
    }
    return null;
  }

  Future<File?> getAPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf']
    );
    if (result != null) {
      File imageFile = File(result.files.single.path!);
      return imageFile;
    }
    return null;
  }

  /// used to get the current store path
  Future<String> getFilePath() async {
    String _sdPath = "";
    // if (Platform.isIOS) {
    //   Directory tempDir = await getTemporaryDirectory();
    //   _sdPath = tempDir.path;
    // } else {
    //   _sdPath = "/storage/emulated/0/new_record_sound";
    // }
    Directory tempDir = await getTemporaryDirectory();
    _sdPath = tempDir.path;
    var d = Directory(_sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    String storagePath = _sdPath + "/" + DateTime.now().toIso8601String() +".m4a";
    return storagePath;
  }

  Future<String> getAddress(LatLng latLng, BuildContext context) async {
    GeoCode geoCode = GeoCode();

    try {
      var address = await geoCode.reverseGeocoding(latitude: latLng.latitude, longitude: latLng.longitude);
      var data = "${address.countryName??""}  ${address.city??""}  ${address.region??""}  ${address.streetAddress??""}";
      print(data);
      return data;
    } catch (e) {
      return "";
    }
  }

  String convertDigitsToLatin(String s) {
    var sb = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }



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

  void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://" + url;
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      CustomToast.showSimpleToast(msg: "من فضلك تآكد من الرابط");
    }
  }

  void launchWhatsApp(phone) async {
    String message = 'مرحبا بك';
    var _whatsAppUrl = "https://api.whatsapp.com/send?phone=+$phone&text=$message";
    if (await canLaunch(_whatsAppUrl)) {
      await launch(_whatsAppUrl);
    } else {
      CustomToast.showSimpleToast(msg: 'حدث خطأ ما');
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


}
