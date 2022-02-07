import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/core/common/appConfig.dart';
import 'package:spark/core/constants/app/app_constants.dart';
import 'package:provider/provider.dart';
import 'core/navigation/base_route.gr.dart';
import 'splash.dart';
import 'core/common/provider_list.dart';
import 'core/navigation/home_navigation_service.dart';
import 'generated/l10n.dart';

final appRouter = AppRouter();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      // like this it works and produces correct font sizes
      data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window),
      child: ScreenUtilInit(
        /// [Size] must be set like as Figma or XD design
        designSize: Size(847, 412),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MultiProvider(
          providers: [
            ...ApplicationProvider().singleItems,
            ...ApplicationProvider().blocItems,
            ...ApplicationProvider().changeNotifierItems,
          ],
          child: Consumer<AppConfig>(
            builder: (context, provider, __) {
              return MaterialApp.router(
                builder: (context, Widget? widget) {
                  ScreenUtil.setContext(context);

                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: widget!,
                  );
                },
                debugShowCheckedModeBanner: false,
                title: ApplicationConstants.TITLE_APP_NAME,
                theme: provider.currentTheme,
                routerDelegate: appRouter.delegate(),
                routeInformationParser: appRouter.defaultRouteParser(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
