import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spark/core/errors/base_error.dart';
import 'package:flutter/material.dart';
part 'base_state.freezed.dart';

@immutable
@freezed
abstract class BaseState<T> with _$BaseState<T>{
  const factory BaseState.init() = _Init;
  const factory BaseState.loading() = _Loading;
  const factory BaseState.success([T? model]) = _Success<T>;
  const factory BaseState.failure(BaseError error, VoidCallback callback) = _Failure;
}