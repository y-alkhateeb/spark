import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark/core/constants/app/app_constants.dart';
import 'package:provider/provider.dart';
import 'aplash.dart';
import 'core/bloc/app_config/app_config_cubit.dart';
import 'core/common/provider_list.dart';
import 'core/localization/localization_provider.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'feature/account/presentation/viewModel/account_bloc.dart';
import 'generated/l10n.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ApplicationProvider().dependItems],
      child: Consumer<LocalizationProvider>(
        builder: (_, provider, __) {
          return ScreenUtilInit(
            designSize: Size(750, 1334),
            builder: ()=> MaterialApp(
              debugShowCheckedModeBanner: false,
              title: ApplicationConstants.TITLE_APP_NAME,
              themeMode: ThemeMode.light,
              // set this Widget as root
              initialRoute: '/',
              navigatorKey: NavigationService.instance.navigatorKey,
              onGenerateRoute: NavigationRoute.instance.generateRoute,
              // theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
              // theme: ThemeData(
              //   appBarTheme: AppBarTheme(
              //     color: AppColors.primaryColor,
              //   ),
              //   primaryColor: AppColors.primaryColor,
              //   accentColor: AppColors.accentColor,
              //   snackBarTheme: const SnackBarThemeData(
              //     actionTextColor: AppColors.white_text,
              //     backgroundColor: AppColors.accentColor,
              //     behavior: SnackBarBehavior.fixed,
              //     elevation: 5.0,
              //   ),
              //   scaffoldBackgroundColor: AppColors.backgroundColor,
              // ),
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
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<AccountBloc>(context).close();
    BlocProvider.of<AppConfigCubit>(context).close();
  }
}
