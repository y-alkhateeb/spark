import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

extension loggerExtension on dynamic{
  void get logE => GetIt.I<Logger>().e(this);
  void get logW => GetIt.I<Logger>().w(this);
}