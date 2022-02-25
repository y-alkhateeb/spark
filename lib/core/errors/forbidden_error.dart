import 'package:spark/app.dart';

import '../../generated/l10n.dart';
import 'base_error.dart';

class ForbiddenError extends BaseError {
  const ForbiddenError();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ForbiddenError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() {
    return S.of(appRouter.navigatorKey.currentContext!).error_forbidden_error;
  }
}