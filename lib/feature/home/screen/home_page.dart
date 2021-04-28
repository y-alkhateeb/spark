import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/core/common/Utils.dart';
import 'package:spark/core/common/app_colors.dart';
import 'package:spark/core/common/dimens.dart';
import 'package:spark/core/constants/app/app_constants.dart';
import 'package:spark/core/localization/localization_provider.dart';
import 'package:spark/core/model/lanuage_model.dart';
import 'package:spark/core/ui/more_item.dart';
import 'package:spark/core/ui/show_dialog.dart';
import 'package:spark/feature/account/presentation/widget/custom_button_widget.dart';
import 'package:spark/generated/l10n.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fdff),
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Spark"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MoreItem(
              title: S.of(context).label_logout,
              image: ApplicationConstants.MENU_LOGOUT,
              onPressed: () async {
                await logout();
              },
            ),
          ],
        ),
      )
    );
  }

}
