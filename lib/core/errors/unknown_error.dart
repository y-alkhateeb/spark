
import 'package:spark/app.dart';

import '../../generated/l10n.dart';
import 'base_error.dart';

class UnknownError extends BaseError {
  const UnknownError();

  @override
  String toString() {
    return S.of(appRouter.navigatorKey.currentContext!).error_unknown_happened;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is UnknownError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}