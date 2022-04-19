import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/common/extension/validator.dart';
import 'package:spark/feature/account/presentation/screen/login/login_controller.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../../../../../core/common/resource.dart';
import '../../../../../../core/ui/my_text_form_field.dart';

class BuildPasswordField extends StatelessWidget {
  final LoginController loginController;
  const BuildPasswordField({Key? key, required this.loginController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: loginController.passCubit,
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        return MyTextFormField(
          formKey: loginController.passwordKey,
          controller: loginController.passwordController,
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.text,
          labelText: S.of(context).label_password,
          suffixIcon: IconButton(
              icon: Icon(
                state.data ? Icons.visibility : Icons.visibility_off,
                color: context.colors.onBackground,
              ),
              onPressed: () {
                loginController.passCubit.onUpdateData(
                    !loginController.passCubit.state.data
                );
              }),
          validator: (value) => value!.noValidate(),
          onFieldSubmitted: (term) {
            loginController.sendRequest(context);
          },
          obscureText: state.data,
        );
      }
    );
  }
}
