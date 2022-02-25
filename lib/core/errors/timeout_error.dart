import 'package:spark/app.dart';
import '../../generated/l10n.dart';
import 'base_error.dart';

class TimeoutError extends BaseError {
  const TimeoutError();

  @override
  String toString() {
    return S.of(appRouter.navigatorKey.currentContext!).error_Timeout_Error;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TimeoutError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}