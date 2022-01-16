import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/bloc/app_config/app_config_cubit.dart';
import 'package:spark/core/navigation/home_navigation_service.dart';
import 'package:provider/provider.dart';
import 'appConfig.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider _instance = ApplicationProvider._init();

  ApplicationProvider._init();

  factory ApplicationProvider() => _instance;

  List<SingleChildWidget> singleItems = [
    Provider.value(value: HomeNS()),
  ];
  List<SingleChildWidget> blocItems = [
    BlocProvider(
      create: (context) => AppConfigCubit(),
    ),
  ];
  List<SingleChildWidget> changeNotifierItems = [
    ChangeNotifierProvider.value(
      value: AppConfig(),
    ),
  ];
}