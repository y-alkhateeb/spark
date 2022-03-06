import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:spark/core/common/resource.dart';
import 'package:spark/core/navigation/base_route.gr.dart';
import 'package:spark/core/ui/more_item.dart';

class ScreenOne extends StatelessWidget {
  static const routeName = "ScreenOne";
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MoreItem(
        title: "navigate To ScreenTwo",
        image: ApplicationConstants.MENU_LOGOUT,
        onPressed: () async {
          context.router.push(ScreenTwoRoute());
          // MoreNS().navigateToPage(path: ScreenTwo.routeName);
          "we are resource".logE;
        },
      ),
    );
  }
}
