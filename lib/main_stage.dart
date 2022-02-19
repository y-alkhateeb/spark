import 'env/enviroment.dart';
import 'main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.stage);
}