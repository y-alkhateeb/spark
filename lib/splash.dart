import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/bloc/app_config/app_config_cubit.dart';
import 'core/datasource/sp_helper.dart';
import 'core/navigation/base_route.gr.dart';

class Splash extends StatefulWidget {
  static const routeName = "SplashRoute";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    checkToken();

  }

  checkToken() {
    Future.delayed(const Duration(seconds: 4), () async{
      if (await SPHelper.hasToken) {
        context.router.replace(BottomBarParent());
        // HomeNS().replacementToPage(path: BottomBar.routeName);
      } else
        context.router.replace(LoginScreenRoute());
        // HomeNS().replacementToPage(path: LoginScreen.routeName);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppConfigCubit, AppConfigState>(
        builder: (context, state) {
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.black45,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(),
                ),
              ],
            ),
          ),
        );
        }
      ),
    );
  }
}
