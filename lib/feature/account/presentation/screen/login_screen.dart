import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:dio/dio.dart';
import 'package:spark/core/helper/validator.dart';
import 'package:spark/core/ui/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/navigation/base_route.gr.dart';
import 'package:spark/core/ui/my_text_form_field.dart';
import 'package:spark/feature/account/presentation/viewModel/user_account_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/ui/my_base_bg_widget.dart';
import '../../../../core/ui/my_logo_on_bg_widget.dart';
import '../../../../core/ui/my_screen_container_widget.dart';
import '../../data/model/request/login_request.dart';
import './../../../../core/common/resource.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = "LoginScreenRoute";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _inAsyncCall = ValueNotifier(false);

  final AccountLoginCubit loginCubit = AccountLoginCubit();

  final cancelToken = CancelToken();

  bool _passwordSecure = true;

  final _phoneOrEmailKey = new GlobalKey<FormFieldState<String>>();
  final _passwordKey = new GlobalKey<FormFieldState<String>>();
  final _phoneOrEmailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController(text: "cityslicka");

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _inAsyncCall,
      child: MyBaseBgWidget(
        child: Scaffold(
          body: Stack(
            children: [
              const MyLogoOnbgWidget(),
              MyScreenContainerWidget(
                top: 200.h,
                child: BlocListener<AccountLoginCubit, AccountLoginState>(
                  bloc: loginCubit,
                  listenWhen: (c, p)=> c.accountLoggingState != p.accountLoggingState,
                  listener: (context, state) {
                    // "state is: $state ".logW;
                    state.accountLoggingState.when(
                      init: (){},
                      loading: (){
                          _inAsyncCall.value = true;
                      },
                      success: (data){
                          _inAsyncCall.value = false;
                        context.router.replace(BottomBarParent());
                      },
                      failure: (_, __){
                          _inAsyncCall.value = false;
                        ShowError.showErrorSnakBar(context, state.accountLoggingState);
                      },
                    );
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Gaps.vGap64,
                        _buildPhoneNumberField(),
                        Gaps.vGap32,
                        _buildPasswordField(),
                        Gaps.vGap128,
                        MyTextButton.primary(
                          text: S.of(context).label_Login,
                          onPressed: sendRequest,
                        ),
                        Gaps.vGap16,
                        Text(
                          S.of(context).label_forget_pass,
                          style: context.textTheme.subtitle2!.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                        Gaps.vGap16,
                        GestureDetector(
                          onTap: (){
                            context.router.push(RegisterScreenRoute());
                          },
                          child: Text(
                            S.of(context).label_register,
                            style: context.textTheme.subtitle2!.copyWith(
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                        Gaps.vGap64,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      builder: (_, value, child) {
        return ModalProgressHUD(
          inAsyncCall: value,
          child: child!,
        );
      }
    );
  }


  authenticate(Uri uri, String clientId, List<String> scopes) async {


  }

  sendRequest() {
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
      labelText: S.of(context).label_email,
      hintText: "example@spark.com",
      validator: (value) => value!.validateEmail(),
    );
  }


  _buildPasswordField() {
    return MyTextFormField(
      formKey: _passwordKey,
      controller: _passwordController,
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.text,
      labelText: S.of(context).label_password,
      suffixIcon: IconButton(
          icon: Icon(
            _passwordSecure ? Icons.visibility : Icons.visibility_off,
            color: context.colors.onBackground,
          ),
          onPressed: () {
            setState(() {
              _passwordSecure = !_passwordSecure;
            });
          }),
      validator: (value) => value!.validatePassword(),
      onFieldSubmitted: (term) {
        sendRequest();
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
    loginCubit.close();
  }
}