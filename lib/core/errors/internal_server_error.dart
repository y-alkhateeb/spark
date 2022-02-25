import 'package:spark/app.dart';

import '../../generated/l10n.dart';
import 'base_error.dart';

class InternalServerError extends BaseError {
  const InternalServerError();

  @override
  String toString() {
    return S.of(appRouter.navigatorKey.currentContext!).error_internal_server;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is InternalServerError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}