import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'custom_toast.dart';

@lazySingleton
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
}
