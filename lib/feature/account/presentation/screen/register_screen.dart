import 'dart:io';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:dio/dio.dart';
import 'package:spark/core/common/extension/validator.dart';
import 'package:spark/core/ui/my_base_bg_widget.dart';
import 'package:spark/core/ui/my_logo_on_bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/navigation/base_route.gr.dart';
import 'package:spark/core/route/animated_route.dart';
import 'package:spark/core/ui/my_text_form_field.dart';
import 'package:spark/feature/account/presentation/viewModel/account_register_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/common/text_formater.dart';
import '../../../../core/ui/my_button.dart';
import '../../../../core/ui/my_popup_showAddImage.dart';
import '../../../../core/ui/my_screen_container_widget.dart';
import './../../../../core/common/resource.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "RegisterScreenRoute";


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AccountRegisterCubit userAccountRegisterCubit = AccountRegisterCubit();
  ValueNotifier<bool> _inAsyncCall = ValueNotifier(false);
  final cancelToken = CancelToken();

  bool _passwordSecure = true;

  // Key
  final _fullNameKey = new GlobalKey<FormFieldState<String>>();
  final _emailKey = new GlobalKey<FormFieldState<String>>();
  final _phoneKey = new GlobalKey<FormFieldState<String>>();
  final _passwordKey = new GlobalKey<FormFieldState<String>>();
  final _birthDateKey = new GlobalKey<FormFieldState<String>>();

  // Controller
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthDateController = TextEditingController();

  ValueNotifier<bool> _termsOfUseCheckBox = ValueNotifier(false);

  ValueNotifier<File?> _imageFile = ValueNotifier(null);


  late AddImageController addImageController;


  @override
  void initState() {
    super.initState();
    addImageController = AddImageController();
  }

  @override
  Widget build(BuildContext context) {
    addImageController.setContext(context);
    return ValueListenableBuilder<bool>(
      valueListenable: _inAsyncCall,
      builder: (_, value, child) {
        return ModalProgressHUD(
          inAsyncCall: value,
          child: child!,
        );
      },
      child: MyBaseBgWidget(
        child: Scaffold(
          body: BlocListener<AccountRegisterCubit, AccountRegisterState>(
            bloc: userAccountRegisterCubit,
            listenWhen: (c, p) => c != p,
            listener: (context, state) {
              state.accountRegisterState.when(
                init: () {},
                loading: () {
                  _inAsyncCall.value = true;
                },
                success: (data) {
                  _inAsyncCall.value = false;
                  context.router.replace(BottomBarParent());
                },
                failure: (_, __) {
                  _inAsyncCall.value = false;
                  ShowError.showErrorSnakBar(
                      context, state.accountRegisterState);
                },
              );
            },
            child: Stack(
              children: [
                const MyLogoOnbgWidget(),
                Positioned(
                  top: 40.h,
                  left: 32,
                  child: SlidingUpAnimated(
                    initialOffsetY: 1,
                    intervalStart: 0.8,
                    intervalEnd: 1,
                    child: GestureDetector(
                      onTap: (){
                        MyPopUpShowAddImage(
                          context,
                          onFilePressed: () async{
                            _imageFile.value = await addImageController.onFilePressed();
                          },
                          onCameraPressed: () async{
                            _imageFile.value = await addImageController.onCameraPressed();
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          decoration: BoxDecoration(
                              color: context.colors.primary,
                          ),
                          height: 100.h,
                          width: 100.h,
                          child: ValueListenableBuilder<File?>(
                            valueListenable: _imageFile,
                            builder: (_, file, __) {
                              if(file == null) return const SizedBox();
                              return Image.file(
                                  file,
                                fit: BoxFit.fill,
                              );
                            }
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                MyScreenContainerWidget(
                  top: 150.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Gaps.vGap24,
                        _buildFullNameField(),
                        Gaps.vGap32,
                        _buildEmailField(),
                        Gaps.vGap32,
                        _buildPhoneField(),
                        Gaps.vGap32,
                        _buildBirthDateField(),
                        Gaps.vGap32,
                        _buildPasswordField(),
                        ValueListenableBuilder<bool>(
                            valueListenable: _termsOfUseCheckBox,
                            builder: (_, value, __) {
                              return CheckboxListTile(
                                title: InkWell(
                                  onTap: () {
                                    /// TODO go to terms of use
                                  },
                                  child: Text(
                                    S.of(context).label_terms_of_use,
                                    style: context.textTheme.subtitle1!
                                        .copyWith(
                                      decoration:
                                          TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                value: value,
                                onChanged: (value) {
                                  _termsOfUseCheckBox.value = value!;
                                },
                              );
                            }),
                        Gaps.vGap8,
                        MyTextButton.primary(
                          text: S.of(context).label_register,
                          onPressed: () {
                            sendRequest();
                          },
                        ),
                        Gaps.vGap16,
                        GestureDetector(
                          onTap: (){
                            context.router.pushAndPopUntil(LoginScreenRoute(), predicate: (Route<dynamic> route) => false,);
                          },
                          child: Text(
                            S.of(context).label_registered_already,
                            style: context.textTheme.subtitle2!.copyWith(
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFullNameField() {
    return MyTextFormField(
      formKey: _fullNameKey,
      controller: _fullNameController,
      textInputAction: TextInputAction.next,
      autofillHints: [AutofillHints.name],
      keyboardType: TextInputType.text,
      labelText: S.of(context).label_full_name,
      validator: (value) => value!.validateName(),
    );
  }

  _buildEmailField() {
    return MyTextFormField(
      formKey: _emailKey,
      controller: _emailController,
      textInputAction: TextInputAction.next,
      autofillHints: [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      labelText: S.of(context).label_email,
      validator: (value) => value!.validateEmail(),
    );
  }

  _buildPhoneField() {
    return MyTextFormField(
      formKey: _phoneKey,
      controller: _phoneController,
      textInputAction: TextInputAction.next,
      autofillHints: [AutofillHints.telephoneNumberDevice],
      keyboardType: TextInputType.phone,
      hintText: "09X-XXX-XXXX",
      labelText: S.of(context).label_phone,
      validator: (value) => value!.validatePhone(),
    );
  }

  _buildPasswordField() {
    return MyTextFormField(
      formKey: _passwordKey,
      controller: _passwordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: [AutofillHints.newPassword],
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
      validator: (value) => value!.validatePassword(),
      obscureText: _passwordSecure,
    );
  }

  _buildBirthDateField() {
    return MyTextFormField(
      formKey: _birthDateKey,
      controller: _birthDateController,
      textInputAction: TextInputAction.go,
      autofillHints: [AutofillHints.birthday],
      keyboardType: TextInputType.datetime,
      labelText: S.of(context).label_birthdate,
      hintText: "DD/MM/YYYY",
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(8),
        birthDateFormatter,
      ],
      onFieldSubmitted: (term) {
        sendRequest();
      },
    );
  }

  sendRequest() {
    context.router.push(OTPScreenRoute());
    // if (_fullNameKey.currentState!.validate()) {
    //   if (_emailKey.currentState!.validate()) {
    //     if (_phoneKey.currentState!.validate()) {
    //       if (_passwordKey.currentState!.validate()) {
    //         if (_birthDateKey.currentState!.validate()) {
    //           userAccountRegisterCubit.registerAccount(RegisterRequest(
    //               firstName: _fullNameController.text,
    //               lastName: _emailController.text,
    //               phoneNumber:
    //                   _phoneController.text.replaceAll(RegExp("[^0-9]"), ""),
    //               email: _phoneController.text,
    //               password: _passwordController.text,
    //               cancelToken: cancelToken));
    //         }
    //       }
    //     }
    //   }
    // }
  }

  @override
  void dispose() {
    super.dispose();
    cancelToken.cancel();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _birthDateController.dispose();
    userAccountRegisterCubit.close();
  }
}
