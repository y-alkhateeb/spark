import 'package:provider/provider.dart';
import 'appConfig.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider _instance = ApplicationProvider._init();

  ApplicationProvider._init();

  factory ApplicationProvider() => _instance;

  List<SingleChildWidget> blocItems = [];
  List<SingleChildWidget> changeNotifierItems = [
    ChangeNotifierProvider.value(
      value: AppConfig(),
    ),
  ];
}