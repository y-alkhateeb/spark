import '../../app.dart';
import '../../generated/l10n.dart';
import 'base_error.dart';

class BadRequestError extends BaseError {
  final String? message;
  const BadRequestError({this.message});


  @override
  String toString() {
    return message ?? '${S.of(appRouter.navigatorKey.currentContext!).error_BadRequest_Error}';
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