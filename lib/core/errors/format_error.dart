
import 'base_error.dart';

class FormatError extends BaseError {

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is FormatError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() {
    return 'Format Error';
  }
}