import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../../../../core/navigation/base_route.gr.dart';
import '../../../data/model/request/login_request.dart';
import '../../../domain/repository/iaccount_repository.dart';

class LoginController{


  final GenericBloc<bool> passCubit = GenericBloc<bool>(false);

  final cancelToken = CancelToken();

  bool passwordSecure = true;

  final phoneOrEmailKey = new GlobalKey<FormFieldState<String>>();
  final passwordKey = new GlobalKey<FormFieldState<String>>();
  final phoneOrEmailController = TextEditingController(text: "eve.holt@reqres.in");
  final passwordController = TextEditingController(text: "cityslicka");



  sendRequest(BuildContext context) async{
    if (phoneOrEmailKey.currentState!.validate()) {
      if (passwordKey.currentState!.validate()) {
        final data = await GetIt.I<IAccountRepository>().login(LoginRequest(
          phoneNumber:phoneOrEmailController.text,//.replaceAll(RegExp("[^0-9]"), ""),
          email: phoneOrEmailController.text,
          password: passwordController.text,
          cancelToken: cancelToken,
        ));
        data.mapOrNull(
            isSuccess: (data){
              context.router.replace(BottomBarParent());
            },
        );
      }
    }
  }
}