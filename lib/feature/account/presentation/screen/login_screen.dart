import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/core/common/Utils.dart';
import 'package:spark/core/common/app_colors.dart';
import 'package:spark/core/common/dimens.dart';
import 'package:spark/core/common/gaps.dart';
import 'package:spark/core/common/validators.dart';
import 'package:spark/core/ui/my_text_form_field.dart';
import 'package:spark/core/ui/show_error.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/presentation/viewModel/account_bloc.dart';
import 'package:spark/feature/account/presentation/widget/custom_button_widget.dart';
import 'package:spark/feature/home/screen/home_page.dart';
import 'package:spark/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _inAsyncCall = false;
  final FocusNode myFocusNodeUserName = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();

  final cancelToken = CancelToken();

  bool _passwordSecure = true;

  final _phoneOrEmailKey = new GlobalKey<FormFieldState<String>>();
  final _passwordKey = new GlobalKey<FormFieldState<String>>();
  final _phoneOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool turnPhoneOrEmailValidate = true;

  bool turnPasswordValidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: _inAsyncCall,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.dp32),
              child: BlocListener(
                listenWhen: (p,c)=>p != c,
                listener: (context, state) {
                  if (state is LoginAccountWaiting) {
                    setState(() {
                      _inAsyncCall = true;
                    });
                  }
                  if (state is LoginAccountSuccess) {
                    setState(() {
                      _inAsyncCall = false;
                    });
                    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                  }  else if (state is LoginAccountGeneralFailure) {
                    setState(() {
                      _inAsyncCall = false;
                    });
                    ShowError.showErrorSnakBar(context, state.error, state);
                  }
                },
                bloc: BlocProvider.of<AccountBloc>(context),
                child: Column(
                  children: <Widget>[
                    Gaps.vGap64,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WELCOME",
                          style: TextStyle(
                            color: AppColors.lightFontColor,
                            fontSize: Dimens.font_sp38,
                          ),
                        ),
                      ],
                    ),
                    Gaps.vGap64,
                    _buildPhoneNumberField(),
                    Gaps.vGap32,
                    _buildPasswordField(),
                    Gaps.vGap128,
                    CustomButton(
                      color: AppColors.greenColor,
                      text: S.of(context).label_Login,
                      textColor: AppColors.lightFontColor,
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
                          style: TextStyle(
                            color: AppColors.lightFontColor,
                            fontSize: ScreenUtil().setSp(Dimens.font_sp28),
                          ),
                        ),
                      ],
                    ),
                    Gaps.vGap64,
                    CustomButton(
                      color: AppColors.lightFontColor,
                      text:
                          S.of(context).label_sign_up,
                      textColor: AppColors.blueFontColor,
                      onPressed: () {
                        unFocus();
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                    ),
                    Gaps.vGap64,
                  ],
                ),
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
        BlocProvider.of<AccountBloc>(context).add(
          LoginAccountEvent(LoginRequest(
            phoneNumber:_phoneOrEmailController.text.
            replaceAll(RegExp("[^0-9]"), ""),
            email: _phoneOrEmailController.text,
            password: _passwordController.text,
            cancelToken: cancelToken,
          )),
        );
      }
    }
  }

  _buildPhoneNumberField() {
    return MyTextFormField(
      formKey: _phoneOrEmailKey,
      controller: _phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: myFocusNodeUserName,
      labelText: S.of(context).label_phone,
      hintText: "09X-XXX-XXXX",
      validator: (value) {
        if (turnPhoneOrEmailValidate) {
          if (Validators.isValidPhoneNumber(value!))
            return null;
          else
            return S.of(context).error_inValid_phone;
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
            color: AppColors.lightFontColor,
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
  }
}