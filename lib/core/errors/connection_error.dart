import '../../app.dart';
import '../../generated/l10n.dart';
import 'base_error.dart';

class ConnectionError extends BaseError {
  const ConnectionError();

  @override
  String toString() {
    return S.of(appRouter.navigatorKey.currentContext!).error_connection;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ConnectionError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
