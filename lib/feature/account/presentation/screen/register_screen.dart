import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/common/Utils.dart';
import 'package:spark/core/common/app_colors.dart';
import 'package:spark/core/common/dimens.dart';
import 'package:spark/core/common/gaps.dart';
import 'package:spark/core/common/validators.dart';
import 'package:spark/core/constants/app/app_constants.dart';
import 'package:spark/core/route/animated_route.dart';
import 'package:spark/core/ui/my_text_form_field.dart';
import 'package:spark/core/ui/show_error.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/presentation/ViewModel/account_bloc.dart';
import 'package:spark/feature/account/presentation/widget/custom_button_widget.dart';
import 'package:spark/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/RegisterScreen";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  bool turnPhoneOrEmailValidate = true;

  bool turnPasswordValidate = true;

  bool turnLastNameValidate = true;

  bool turnNameValidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            S.of(context).label_sign_up
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
          child: BlocListener(
            listenWhen: (p,c)=>p != c,
            listener: (context, state) {
              if (state is RegisterAccountWaiting) {
                setState(() {
                  _inAsyncCall = true;
                });
              }
              if (state is RegisterAccountSuccess) {
                setState(() {
                  _inAsyncCall = false;
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Register Account Success now login")),
                );
                Navigator.pop(context);
              } else if (state is RegisterAccountGeneralFailure) {
                setState(() {
                  _inAsyncCall = false;
                });
                ShowError.showErrorSnakBar(context, state.error, state);
              }
            },
            bloc: BlocProvider.of<AccountBloc>(context),
            child: _buildScreen(),
          ),
        ),
      ),
    );
  }

  _buildScreen(){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height -
            kToolbarHeight -
            MediaQuery.of(context).padding.top,
        decoration: const BoxDecoration(
          image: const DecorationImage(
              image: const AssetImage(ApplicationConstants.REGISTER_BACKGROUND),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.dp32, vertical: Dimens.dp32),
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
                child: _buildEmailField(),
              ),
              Gaps.vGap32,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.2,
                intervalEnd: 0.4,
                child: _buildEmailField(),
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
              Gaps.vGap128,
              SlidingAnimated(
                initialOffsetX: 1,
                intervalStart: 0.2,
                intervalEnd: 1,
                child: CustomButton(
                  color: AppColors.greenColor,
                  text: S.of(context)
                      .label_sign_up,
                  textColor: AppColors.lightFontColor,
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
      color: AppColors.regularFontColor,
      formKey: _nameKey,
      controller: _nameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodeName,
      labelText: S.of(context).label_first_name,
      validator: (value) {
        if (turnNameValidate) {
          if (Validators.isValidName(value!))
            return null;
          else
            return S.of(context).error_inValid_name;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        fieldFocusChange(context, myFocusNodeName, myFocusNodeLastName);
      },
      onChanged: (value) {
        if (turnNameValidate) {
          setState(() {
            turnNameValidate = false;
          });
          _nameKey.currentState!.validate();
        }
      },
    );
  }

  _buildLastNameField() {
    return MyTextFormField(
      color: AppColors.regularFontColor,
      formKey: _lastNameKey,
      controller: _lastNameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: myFocusNodeLastName,
      labelText: S.of(context).label_last_name,
      validator: (value) {
        if (turnLastNameValidate) {
          if (Validators.isValidName(value!))
            return null;
          else
            return S.of(context).error_inValid_name;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        fieldFocusChange(context, myFocusNodeLastName, myFocusNodePhoneOrEmail);
      },
      onChanged: (value) {
        if (turnLastNameValidate) {
          setState(() {
            turnLastNameValidate = false;
          });
          _lastNameKey.currentState!.validate();
        }
      },
    );
  }

  _buildPhoneField() {
    return MyTextFormField(
      color: AppColors.regularFontColor,
      formKey: _phoneOrEmailKey,
      controller: _phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: myFocusNodePhoneOrEmail,
      hintText: "09X-XXX-XXXX",
      labelText: S.of(context).label_phone,
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
        fieldFocusChange(context, myFocusNodePhoneOrEmail, myFocusNodePassword);
      },
      onChanged: (value) {
        if (turnPhoneOrEmailValidate) {
          setState(() {
            turnPhoneOrEmailValidate = false;
          });
          _phoneOrEmailKey.currentState!.validate();
        }
      },
    );
  }

  _buildEmailField() {
    return MyTextFormField(
      color: AppColors.regularFontColor,
      formKey: _phoneOrEmailKey,
      controller: _phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      focusNode: myFocusNodePhoneOrEmail,
      labelText: S.of(context).label_email,
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
        fieldFocusChange(context, myFocusNodePhoneOrEmail, myFocusNodePassword);
      },
      onChanged: (value) {
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
      color: AppColors.regularFontColor,
      formKey: _passwordKey,
      controller: _passwordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      focusNode: myFocusNodePassword,
      labelText: S.of(context).label_password,
      suffixIcon: IconButton(
          icon: Icon(
            _passwordSecure ? Icons.visibility : Icons.visibility_off,
            color: AppColors.regularFontColor,
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
        if (turnPasswordValidate) {
          if (Validators.isValidPassword(value!))
            return null;
          else
            return S.of(context).error_password_short;
        } else
          return null;
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

  _buildConfirmPasswordField() {
    return MyTextFormField(
      color: AppColors.regularFontColor,
      formKey: _confirmPasswordKey,
      controller: _confirmPasswordController,
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.visiblePassword,
      focusNode: myFocusNodeConfirmPassword,
      labelText: S.of(context).label_confirm_password,
      suffixIcon: IconButton(
          icon: Icon(
            _confirmPasswordSecure ? Icons.visibility : Icons.visibility_off,
            color: AppColors.regularFontColor,
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
      onChanged: (value) {
        _passwordKey.currentState!.validate();
      },
      obscureText: _confirmPasswordSecure,
    );
  }

  sendRequest() {
    unFocus();
    setState(() {
      turnPhoneOrEmailValidate = true;

      turnPasswordValidate = true;

      turnLastNameValidate = true;

      turnNameValidate = true;
    });

    if (_nameKey.currentState!.validate()) {
     if (_lastNameKey.currentState!.validate()) {
      if (_phoneOrEmailKey.currentState!.validate()) {
        if (_passwordKey.currentState!.validate()) {
          if (_confirmPasswordKey.currentState!.validate()) {
            BlocProvider.of<AccountBloc>(context).add(
              RegisterAccountEvent(RegisterRequest(
                  firstName: _nameController.text,
                  lastName: _lastNameController.text,
                  phoneNumber: _phoneOrEmailController.text.
                  replaceAll(RegExp("[^0-9]"), ""),
                  email: _phoneOrEmailController.text,
                  password: _passwordController.text,
                  cancelToken: cancelToken)),
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
  }
}
