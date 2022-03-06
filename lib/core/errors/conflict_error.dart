import 'package:get_it/get_it.dart';

import '../../generated/l10n.dart';
import '../navigation/base_route.gr.dart';
import 'base_error.dart';

class ConflictError extends BaseError {
  const ConflictError();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ConflictError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() {
    return S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).error_conflict;
  }

}