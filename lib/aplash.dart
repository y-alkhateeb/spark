import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/bloc/app_config/app_config_cubit.dart';
import 'feature/account/presentation/screen/login_screen.dart';
import 'feature/home/screen/home_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  checkToken(AppConfigState state) {
    Future.delayed(const Duration(seconds: 4), () async {
      if (await state.isUserAuthenticated) {
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      } else
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppConfigCubit, AppConfigState>(
        builder: (context, state) {
          checkToken(state);
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
                    child: Container()),
              ],
            ),
          ),
        );
        }
      ),
    );
  }
}
