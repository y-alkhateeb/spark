import 'package:get_it/get_it.dart';

import '../../generated/l10n.dart';
import '../navigation/base_route.gr.dart';
import 'base_error.dart';

class BadRequestError extends BaseError {
  final String? message;
  const BadRequestError({this.message});


  @override
  String toString() {
    return message ?? '${S.of(GetIt.I<AppRouter>().navigatorKey.currentContext!).error_BadRequest_Error}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is BadRequestError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}