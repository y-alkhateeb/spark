import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/localization/localization_provider.dart';
import 'package:spark/core/navigation/navigation_service.dart';
import 'package:spark/feature/account/presentation/viewModel/account_bloc.dart';
import 'package:provider/provider.dart';
import 'theme_notifer.dart';
import 'package:provider/single_child_widget.dart';
class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    // ChangeNotifierProvider(
    //   create: (context) => ThemeNotifier(),
    // ),
    Provider.value(value: NavigationService.instance),
    ChangeNotifierProvider.value(
      value: LocalizationProvider.instance,
    ),
    BlocProvider(
      create: (context) => AccountBloc(),
      lazy: true,
    ),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}