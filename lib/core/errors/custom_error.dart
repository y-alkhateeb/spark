import 'base_error.dart';

class CustomError extends BaseError {
  final String message;

  const CustomError({required this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is CustomError &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}