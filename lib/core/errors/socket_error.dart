import '../../app.dart';
import '../../generated/l10n.dart';
import 'base_error.dart';

class SocketError extends BaseError {
  const SocketError();

  @override
  String toString() {
    return S.of(appRouter.navigatorKey.currentContext!).error_socket;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is SocketError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}