import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/common/Utils.dart';
import 'package:spark/core/common/validators.dart';
import 'package:spark/core/navigation/base_route.gr.dart';
import 'package:spark/core/ui/my_text_form_field.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/presentation/viewModel/user_account_cubit.dart';
import 'package:spark/feature/account/presentation/widget/custom_button_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import './../../../../core/common/resource.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _inAsyncCall = false;
  final FocusNode myFocusNodeUserName = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();

  final AccountLoginCubit loginCubit = AccountLoginCubit();

  final cancelToken = CancelToken();

  bool _passwordSecure = true;

  final _phoneOrEmailKey = new GlobalKey<FormFieldState<String>>();
  final _passwordKey = new GlobalKey<FormFieldState<String>>();
  final _phoneOrEmailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController(text: "cityslicka");

  bool turnPhoneOrEmailValidate = true;

  bool turnPasswordValidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: _inAsyncCall,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.dp32),
            child: BlocListener<AccountLoginCubit, AccountLoginState>(
              bloc: loginCubit,
              listenWhen: (c, p)=> c != p,
              listener: (context, state) {
                // "state is: $state ".logW;
                state.accountLoggingState.when(
                    init: (){},
                    loading: (){
                      setState(() {
                        _inAsyncCall = true;
                      });
                    },
                    success: (data){
                      setState(() {
                        _inAsyncCall = false;
                      });
                      context.router.replace(BottomBarParent());
                      // Navigator.of(context).pushReplacementNamed(BottomBar.routeName);
                    },
                    failure: (_, __){
                      setState(() {
                        _inAsyncCall = false;
                      });
                      ShowError.showErrorSnakBar(context, state.accountLoggingState);
                    },
                );
              },
              child: Column(
                children: <Widget>[
                  Gaps.vGap64,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WELCOME",
                        style: context.textTheme.overline!.copyWith(
                            color: context.colors.background
                        )
                      ),
                    ],
                  ),
                  Gaps.vGap64,
                  _buildPhoneNumberField(),
                  Gaps.vGap32,
                  _buildPasswordField(),
                  Gaps.vGap128,
                  CustomButton(
                    color: context.colors.secondary,
                    text: S.of(context).label_Login,
                    textColor: context.colors.background,
                    onPressed: () {
                      sendRequest();
                    },
                  ),
                  Gaps.vGap64,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        S.of(context).label_or_u_can,
                        style: context.textTheme.headline4!.copyWith(
                          color: context.colors.background,
                        ),
                      ),
                    ],
                  ),
                  Gaps.vGap64,
                  CustomButton(
                    color: context.colors.background,
                    text:
                        S.of(context).label_sign_up,
                    textColor: context.colors.surface,
                    onPressed: () {
                      unFocus();
                      context.router.push(RegisterScreenRoute());
                      // Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                  ),
                  Gaps.vGap64,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  unFocus() {
    unFocusList(focus: [
      myFocusNodeUserName,
      myFocusNodePassword,
    ]);
  }

  sendRequest() {
    unFocus();
    setState(() {
      turnPhoneOrEmailValidate = true;
      turnPasswordValidate = true;
    });
    if (_phoneOrEmailKey.currentState!.validate()) {
      if (_passwordKey.currentState!.validate()) {
        loginCubit.loginAccount(
            LoginRequest(
              phoneNumber:_phoneOrEmailController.text,//.replaceAll(RegExp("[^0-9]"), ""),
              email: _phoneOrEmailController.text,
              password: _passwordController.text,
              cancelToken: cancelToken,
            )
        );
      }
    }
  }

  _buildPhoneNumberField() {
    return MyTextFormField(
      formKey: _phoneOrEmailKey,
      controller: _phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      focusNode: myFocusNodeUserName,
      labelText: S.of(context).label_email,
      hintText: "example@spark.com",
      validator: (value) {
        if (turnPhoneOrEmailValidate) {
          if (Validators.isValidEmail(value!))
            return null;
          else
            return S.of(context).error_inValid_email;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        fieldFocusChange(context, myFocusNodeUserName, myFocusNodePassword);
      },
      onChanged: (val) {
        if (turnPhoneOrEmailValidate) {
          setState(() {
            turnPhoneOrEmailValidate = false;
          });
          _phoneOrEmailKey.currentState!.validate();
        }
      },
    );
  }


  _buildPasswordField() {
    return MyTextFormField(
      formKey: _passwordKey,
      controller: _passwordController,
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodePassword,
      labelText: S.of(context).label_password,
      suffixIcon: IconButton(
          icon: Icon(
            _passwordSecure ? Icons.visibility : Icons.visibility_off,
            color: context.colors.background,
          ),
          onPressed: () {
            setState(() {
              _passwordSecure = !_passwordSecure;
            });
          }),
      validator: (value) {
        if (turnPasswordValidate) {
          if (Validators.isValidPassword(value!))
            return null;
          else
            return S.of(context).error_password_short;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        sendRequest();
      },
      onChanged: (val) {
        if (turnPasswordValidate) {
          setState(() {
            turnPasswordValidate = false;
          });
          _passwordKey.currentState!.validate();
        }
      },
      obscureText: _passwordSecure,
    );
  }

  @override
  void dispose() {
    super.dispose();
    cancelToken.cancel();
    _phoneOrEmailController.dispose();
    _passwordController.dispose();
    myFocusNodeUserName.dispose();
    myFocusNodePassword.dispose();
    loginCubit.close();
  }
}