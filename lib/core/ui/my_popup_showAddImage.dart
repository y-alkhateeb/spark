import 'dart:io';

import 'package:spark/core/ui/show_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../generated/l10n.dart';

class AddImageController{
  late BuildContext _context;

  void setContext(BuildContext context)=> _context = context;


  Future<File?> onCameraPressed() async {
    try {
      Navigator.pop(_context);
      final picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 40,
      );
      if (pickedFile == null) {
        return null;
      } else {
        return File(pickedFile.path);
      }
    } on PlatformException catch (e) {
      if (e.code == "camera_access_denied") {
        ShowError.showCustomError(e.message!);
      }
      return null;
    }
  }



  Future<File?> onFilePressed() async{
    Navigator.pop(_context);
      final picker = ImagePicker();
      var pickedFile;
      try {
        pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 40,
        );
      } catch (e) {
        print(e);
      }
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      else return null;
  }



}




Future MyPopUpShowAddImage(
  BuildContext context, {
  required VoidCallback onCameraPressed,
  required VoidCallback onFilePressed,
}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: onCameraPressed,
              child: Text(
                S.of(context).camera,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: onFilePressed,
              child: Text(
                S.of(context).pick,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).app_cancel,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        );
      });
}
