import 'package:spark/core/common/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/appConfig.dart';
import '../../../core/model/lanuage_model.dart';
import '../../../core/route/animated_route.dart';
import '../../../core/ui/my_app_bar_widget.dart';
import '../../../core/ui/my_base_bg_widget.dart';
import '../../../core/ui/my_button.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/my_screen_container_widget.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = "SettingScreenRoute";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyBaseBgWidget(
      child: Scaffold(
        body: Stack(
          children: [
            MyAppBarWidget(
              title: S.of(context).label_setting,
            ),
            MyScreenContainerWidget(
              top: 100.h,
              child: Column(
                children: [
                  Gaps.vGap64,
                  ListTile(
                    title: Text(
                        S.of(context).label_change_language,
                      style: context.textTheme.headline3,
                    ),
                    trailing: Text(
                        Provider.of<AppConfig>(context).currentLanguage,
                      style: context.textTheme.headline3,
                    ),
                    onTap: () async {
                      _buildChangeLanguage(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildChangeLanguage(BuildContext context) {
    int? _currentLangValue =
    Localizations.localeOf(context).languageCode == ApplicationConstants.LANG_AR
        ? LanguageModel.getLanguage().first.languageId
        : LanguageModel.getLanguage().last.languageId;
    ShowDialog().showTransparentDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.40,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(60.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: LanguageModel.getLanguage()
                            .map(
                              (e) => RadioListTile(
                            groupValue: _currentLangValue,
                            value: e.languageId,
                            title: Text(
                                e.languageName,style:context.textTheme.headline4),
                            onChanged: (int? val) {
                              setState(() {
                                _currentLangValue = val;
                              });
                            },
                          ),
                        )
                            .toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyTextButton.secondary(
                            width: 95.w,
                            text: S.of(context).app_cancel,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          MyTextButton.primary(
                            width: 95.w,
                            text: S.of(context).app_confirm,
                            onPressed: () {
                              context.read<AppConfig>()
                                  .changeLanguage(
                                LanguageModel.getLanguage()[_currentLangValue!]
                                    .locale,
                                context,
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

}
