import 'base_error.dart';

class CustomError extends BaseError {
  final String message;

  CustomError({required this.message});

  @override
  List<Object> get props => [];
}