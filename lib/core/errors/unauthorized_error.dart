import 'package:get_it/get_it.dart';

import '../../generated/l10n.dart';
import '../navigation/base_route.gr.dart';
import 'base_error.dart';

class UnauthorizedError extends BaseError {
  const UnauthorizedError();

  @override
  String toString() {
    return S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).error_Unauthorized_Error;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is UnauthorizedError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}