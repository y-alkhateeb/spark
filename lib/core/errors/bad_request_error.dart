import 'base_error.dart';

class BadRequestError extends BaseError {
  const BadRequestError();


  @override
  String toString() {
    return 'Bad Request..';
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