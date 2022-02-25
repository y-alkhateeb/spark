
import 'package:spark/app.dart';

import '../../generated/l10n.dart';
import 'base_error.dart';

class UnknownError extends BaseError {
  const UnknownError();

  @override
  String toString() {
    return S.of(appRouter.navigatorKey.currentContext!).error_unknown_happened;
  }
}