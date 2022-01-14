import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/core/bloc/app_config/app_config_cubit.dart';
import 'package:spark/core/common/appConfig.dart';
import 'package:spark/core/constants/app/app_constants.dart';
import 'package:spark/core/model/lanuage_model.dart';
import 'package:spark/core/ui/more_item.dart';
import 'package:spark/feature/account/presentation/widget/custom_button_widget.dart';
import '../../../core/common/resource.dart';


class HomePage extends StatefulWidget {
  static const routeName = "/Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spark"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoreItem(
            title: "just log",
            image: ApplicationConstants.MENU_LOGOUT,
            onPressed: () async {
              "we are resource".logE;
            },
          ),
          MoreItem(
            title: S.of(context).label_change_language,
            image: ApplicationConstants.MENU_LOGOUT,
            onPressed: () async {
              _buildChangeLanguage();
            },
          ),
          MoreItem(
            title: S.of(context).label_change_theme,
            image: ApplicationConstants.MENU_LOGOUT,
            onPressed: () async {
              context.read<AppConfig>().changeTheme();
            },
          ),
          MoreItem(
            title: S.of(context).label_logout,
            image: ApplicationConstants.MENU_LOGOUT,
            onPressed: () async {
              BlocProvider.of<AppConfigCubit>(context,listen: false).userLogout();
            },
          ),
        ],
      ),
    );
  }

  _buildChangeLanguage() {
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
                      BorderRadius.circular(ScreenUtil().setWidth(60))),
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
                            activeColor: context.colors.surface,
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
                          OutlineButton(
                            onPressed: () => Navigator.pop(context),
                            color: Colors.white,
                            highlightedBorderColor: context.colors.error,
                            splashColor: context.colors.primary.withAlpha(20),
                            borderSide: BorderSide(
                              color: context.colors.surface,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: Dimens.dp64,
                              ),
                              child: Text(
                                S.of(context).app_cancel,
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline4,
                              ),
                            ),
                          ),
                          CustomButton(
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
