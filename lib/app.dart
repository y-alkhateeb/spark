import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/core/common/appConfig.dart';
import 'package:spark/core/constants/app/app_constants.dart';
import 'package:provider/provider.dart';
import 'splash.dart';
import 'core/common/provider_list.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// [Size] must be set like as Figma or XD design
      designSize: Size(847, 412),
      builder: () => MultiProvider(
        providers: [
          ...ApplicationProvider().singleItems,
          ...ApplicationProvider().blocItems,
          ...ApplicationProvider().changeNotifierItems,
        ],
        child: Consumer<AppConfig>(
          builder: (context, provider, __) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: ApplicationConstants.TITLE_APP_NAME,
              theme: provider.currentTheme,
              // set this Widget as root
              initialRoute: '/',
              navigatorKey: Navi().navigatorKey,
              onGenerateRoute: NavigationRoute.instance.generateRoute,
              supportedLocales: S.delegate.supportedLocales,
              locale: provider.appLocal,
              // These delegates make sure that the localization data for the proper language is loaded
              localizationsDelegates: [
                // 1
                S.delegate,
                // 2
                // Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,
                // Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              home: Splash(),
            );
          },
        ),
      ),
    );
  }
}
