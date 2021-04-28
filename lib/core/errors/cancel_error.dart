import './base_error.dart';

class CancelError extends BaseError {
  final String? message;

  CancelError(this.message);
  @override
  List<Object> get props => [];
}