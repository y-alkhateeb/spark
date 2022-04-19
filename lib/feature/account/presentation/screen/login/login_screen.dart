import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:spark/core/ui/my_button.dart';
import 'package:flutter/material.dart';
import 'package:spark/core/navigation/base_route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/ui/my_base_bg_widget.dart';
import '../../../../../core/ui/my_logo_on_bg_widget.dart';
import '../../../../../core/ui/my_screen_container_widget.dart';
import '../../../../../core/common/resource.dart';
import 'login_controller.dart';
import 'widget/build_password_field.dart';
import 'widget/build_phone_number_field.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = "LoginScreenRoute";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return MyBaseBgWidget(
      child: Scaffold(
        body: Stack(
          children: [
            const MyLogoOnbgWidget(),
            MyScreenContainerWidget(
              top: 200.h,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Gaps.vGap64,
                    BuildPhoneNumberField(
                      loginController: _loginController,
                    ),
                    Gaps.vGap32,
                    BuildPasswordField(
                      loginController: _loginController,
                    ),
                    Gaps.vGap128,
                    MyTextButton.primary(
                      text: S.of(context).label_Login,
                      onPressed: (){
                        _loginController.sendRequest(context);
                      },
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
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _loginController.cancelToken.cancel();
    _loginController.phoneOrEmailController.dispose();
    _loginController.passwordController.dispose();
    _loginController.loginCubit.close();
    _loginController.passCubit.close();
  }
}