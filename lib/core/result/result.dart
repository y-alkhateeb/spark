import 'package:freezed_annotation/freezed_annotation.dart';
import '../errors/base_error.dart';

part 'result.freezed.dart';

@immutable
@freezed
class Result<T> with _$Result<T>{
  const factory Result.isSuccess([T? model]) = _IsSuccess;
  const factory Result.isError(BaseError error) = _IsError;
}
