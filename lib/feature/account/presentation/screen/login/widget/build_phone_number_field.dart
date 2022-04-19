import 'package:flutter/material.dart';
import 'package:spark/core/common/extension/validator.dart';

import '../../../../../../core/ui/my_text_form_field.dart';
import '../../../../../../generated/l10n.dart';
import '../login_controller.dart';

class BuildPhoneNumberField extends StatelessWidget {
  final LoginController loginController;
  const BuildPhoneNumberField({Key? key,  required this.loginController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      formKey: loginController.phoneOrEmailKey,
      controller: loginController.phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      labelText: S.of(context).label_email,
      hintText: "example@spark.com",
      validator: (value) => value!.validateEmail(),
    );
  }
}
