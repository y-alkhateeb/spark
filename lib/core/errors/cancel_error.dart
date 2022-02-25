import '../../app.dart';
import '../../generated/l10n.dart';
import './base_error.dart';

class CancelError extends BaseError {

  const CancelError();


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is CancelError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() {
    return S.of(appRouter.navigatorKey.currentContext!).error_cancel_token;
  }
}