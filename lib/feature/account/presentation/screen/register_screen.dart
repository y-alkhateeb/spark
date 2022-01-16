import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/common/Utils.dart';
import 'package:spark/core/common/validators.dart';
import 'package:spark/core/navigation/base_route.gr.dart';
import 'package:spark/core/route/animated_route.dart';
import 'package:spark/core/ui/my_text_form_field.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/presentation/viewModel/account_register_cubit.dart';
import 'package:spark/feature/account/presentation/widget/custom_button_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import './../../../../core/common/resource.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/RegisterScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AccountRegisterCubit userAccountRegisterCubit = AccountRegisterCubit();
  bool _inAsyncCall = false;
  final cancelToken = CancelToken();
  final FocusNode myFocusNodeName = FocusNode();
  final FocusNode myFocusNodeLastName = FocusNode();
  final FocusNode myFocusNodePhoneOrEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeConfirmPassword = FocusNode();

  bool _passwordSecure = true;
  bool _confirmPasswordSecure = true;

  // Key
  final _nameKey = new GlobalKey<FormFieldState<String>>();
  final _lastNameKey = new GlobalKey<FormFieldState<String>>();
  final _phoneOrEmailKey = new GlobalKey<FormFieldState<String>>();
  final _passwordKey = new GlobalKey<FormFieldState<String>>();
  final _confirmPasswordKey = new GlobalKey<FormFieldState<String>>();

  // Controller
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            S.of(context).label_sign_up,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ApplicationConstants.REGISTER_BACKGROUND),
            fit: BoxFit.fill,
          ),
        ),
        child: ModalProgressHUD(
          inAsyncCall: _inAsyncCall,
          child: BlocListener<AccountRegisterCubit, AccountRegisterState>(
            bloc: userAccountRegisterCubit,
            listenWhen: (c, p) => c != p,
            listener: (context, state) {
              "state is: $state ".logW;
              state.accountRegisterState.when(
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
                    ShowError.showErrorSnakBar(context, state.accountRegisterState);
                  },
              );
            },
            child: _buildScreen(),
          ),
        ),
      ),
    );
  }

  _buildScreen(){
    return Container(
      height: context.bodyHeight,
      decoration: const BoxDecoration(
        image: const DecorationImage(
            image: const AssetImage(ApplicationConstants.REGISTER_BACKGROUND),
            fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.dp32),
          child: Column(
            children: <Widget>[
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0,
                intervalEnd: 0.1,
                child: _buildNameField(),
              ),
              Gaps.vGap32,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.1,
                intervalEnd: 0.2,
                child: _buildLastNameField(),
              ),
              Gaps.vGap32,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.2,
                intervalEnd: 0.4,
                child: _buildPhoneField(),
              ),
              Gaps.vGap32,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.4,
                intervalEnd: 0.6,
                child: _buildPasswordField(),
              ),
              Gaps.vGap32,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.6,
                intervalEnd: 0.8,
                child: _buildConfirmPasswordField(),
              ),
              Gaps.vGap64,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.2,
                intervalEnd: 1,
                child: CustomButton(
                  color: context.colors.secondary,
                  text: S.of(context)
                      .label_sign_up,
                  textColor: context.colors.background,
                  onPressed: () {
                    sendRequest();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  unFocus() {
    unFocusList(focus: [
      myFocusNodeName,
      myFocusNodeLastName,
      myFocusNodePhoneOrEmail,
      myFocusNodePassword,
      myFocusNodeConfirmPassword,
    ]);
  }

  _buildNameField() {
    return MyTextFormField(
      color: context.colors.onSecondary,
      formKey: _nameKey,
      controller: _nameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodeName,
      labelText: S.of(context).label_first_name,
      validator: (value) {
          if (Validators.isValidName(value!))
            return null;
          else
            return S.of(context).error_inValid_name;
      },
      onFieldSubmitted: (term) {
        fieldFocusChange(context, myFocusNodeName, myFocusNodeLastName);
      },
    );
  }

  _buildLastNameField() {
    return MyTextFormField(
      color: context.colors.onSecondary,
      formKey: _lastNameKey,
      controller: _lastNameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodeLastName,
      labelText: S.of(context).label_last_name,
      validator: (value) {
          if (Validators.isValidName(value!))
            return null;
          else
            return S.of(context).error_inValid_name;
      },
      onFieldSubmitted: (term) {
        fieldFocusChange(context, myFocusNodeLastName, myFocusNodePhoneOrEmail);
      },
    );
  }

  _buildPhoneField() {
    return MyTextFormField(
      color: context.colors.onSecondary,
      formKey: _phoneOrEmailKey,
      controller: _phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: myFocusNodePhoneOrEmail,
      hintText: "09X-XXX-XXXX",
      labelText: S.of(context).label_phone,
      validator: (value) {
          if (Validators.isValidPhoneNumber(value!))
            return null;
          else
            return S.of(context).error_inValid_phone;
      },
      onFieldSubmitted: (term) {
        fieldFocusChange(context, myFocusNodePhoneOrEmail, myFocusNodePassword);
      },
    );
  }

  // _buildEmailField() {
  //   return MyTextFormField(
  //     color: AppColors.regularFontColor,
  //     formKey: _phoneOrEmailKey,
  //     controller: _phoneOrEmailController,
  //     textInputAction: TextInputAction.next,
  //     keyboardType: TextInputType.emailAddress,
  //     focusNode: myFocusNodePhoneOrEmail,
  //     labelText: S.of(context).label_email,
  //     validator: (value) {
  //       if (turnPhoneOrEmailValidate) {
  //         if (Validators.isValidEmail(value!))
  //           return null;
  //         else
  //           return S.of(context).error_inValid_email;
  //       } else
  //         return null;
  //     },
  //     onFieldSubmitted: (term) {
  //       fieldFocusChange(context, myFocusNodePhoneOrEmail, myFocusNodePassword);
  //     },
  //     onChanged: (value) {
  //       if (turnPhoneOrEmailValidate) {
  //         setState(() {
  //           turnPhoneOrEmailValidate = false;
  //         });
  //         _phoneOrEmailKey.currentState!.validate();
  //       }
  //     },
  //   );
  // }

  _buildPasswordField() {
    return MyTextFormField(
      color: context.colors.onSecondary,
      formKey: _passwordKey,
      controller: _passwordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      focusNode: myFocusNodePassword,
      labelText: S.of(context).label_password,
      suffixIcon: IconButton(
          icon: Icon(
            _passwordSecure ? Icons.visibility : Icons.visibility_off,
            color: context.colors.onSecondary,
          ),
          onPressed: () {
            setState(() {
              _passwordSecure = !_passwordSecure;
            });
          }),
      onFieldSubmitted: (term) {
        fieldFocusChange(
            context, myFocusNodePassword, myFocusNodeConfirmPassword);
      },
      validator: (value) {
          if (Validators.isValidPassword(value!))
            return null;
          else
            return S.of(context).error_password_short;

      },
      obscureText: _passwordSecure,
    );
  }

  _buildConfirmPasswordField() {
    return MyTextFormField(
      color: context.colors.onSecondary,
      formKey: _confirmPasswordKey,
      controller: _confirmPasswordController,
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.visiblePassword,
      focusNode: myFocusNodeConfirmPassword,
      labelText: S.of(context).label_confirm_password,
      suffixIcon: IconButton(
          icon: Icon(
            _confirmPasswordSecure ? Icons.visibility : Icons.visibility_off,
            color: context.colors.onSecondary,
          ),
          onPressed: () {
            setState(() {
              _confirmPasswordSecure = !_confirmPasswordSecure;
            });
          }),
      validator: (value) {
        if (_passwordController.text == value)
          return null;
        else
          return S.of(context).error_confirm_password;
      },
      onFieldSubmitted: (term) {
        sendRequest();
      },
      obscureText: _confirmPasswordSecure,
    );
  }

  sendRequest() {
    unFocus();
    if (_nameKey.currentState!.validate()) {
     if (_lastNameKey.currentState!.validate()) {
      if (_phoneOrEmailKey.currentState!.validate()) {
        if (_passwordKey.currentState!.validate()) {
          if (_confirmPasswordKey.currentState!.validate()) {
            userAccountRegisterCubit.registerAccount(
                RegisterRequest(
                    firstName: _nameController.text,
                    lastName: _lastNameController.text,
                    phoneNumber: _phoneOrEmailController.text.
                    replaceAll(RegExp("[^0-9]"), ""),
                    email: _phoneOrEmailController.text,
                    password: _passwordController.text,
                    cancelToken: cancelToken)
            );
          }
        }
      }
    }
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancelToken.cancel();
    myFocusNodeName.dispose();
    myFocusNodeLastName.dispose();
    myFocusNodePhoneOrEmail.dispose();
    myFocusNodePassword.dispose();
    myFocusNodeConfirmPassword.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneOrEmailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    userAccountRegisterCubit.close();
  }
}
