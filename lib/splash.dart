import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:spark/core/common/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/bloc/app_config/app_config_cubit.dart';
import 'core/datasource/sp_helper.dart';
import 'core/navigation/base_route.gr.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashRoute";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkToken();

  }

  checkToken() {
    Future.delayed(const Duration(seconds: 3), () async{
      if (await SPHelper.hasToken) {
        context.router.replace(BottomBarParent());
      } else{
        if(SPHelper.isRunTutorial == null){
          SPHelper.persistRunTutorial(true);
          context.router.replace(TutorialScreenRoute());
        }
        else{
          context.router.replace(LoginScreenRoute());
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 252, 255),
      body: BlocBuilder<AppConfigCubit, AppConfigState>(
          builder: (context, state) {
            return Center(
                child: Image.asset(ApplicationConstants.IMAGE_SPLASH)
            );
          }
      ),
    );
  }
}
