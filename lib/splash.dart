import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:get_it/get_it.dart';
import 'package:spark/core/common/resource.dart';
import 'package:flutter/material.dart';
import 'core/datasource/isp_helper.dart';
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
      if (await GetIt.I<ISpHelper>().hasToken) {
        context.router.replace(BottomBarParent());
      } else{
        if(await GetIt.I<ISpHelper>().isRunTutorial == null){
          await GetIt.I<ISpHelper>().writeRunTutorial(true);
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
      body: Center(
          child: Image.asset(ApplicationConstants.IMAGE_SPLASH)
      ),
    );
  }
}
