import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feature/account/data/repository/account_repository.dart';
import 'feature/account/presentation/screen/login_screen.dart';
import 'feature/home/screen/home_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  checkToken(){
    Future.delayed(
        const Duration(seconds: 4),
        () async {
          if(await AccountRepository.hasToken){
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          }
          else Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container()
                ),
              ],
            ),
        ),
      ),
    );
  }
}