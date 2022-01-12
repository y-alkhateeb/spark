import 'base_error.dart';

class CustomError extends BaseError {
  final String message;

  const CustomError({required this.message});
}