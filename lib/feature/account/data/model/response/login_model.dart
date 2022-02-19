import 'package:freezed_annotation/freezed_annotation.dart';


part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    final String? token,
    final Account? account,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}

@freezed
class Account with _$Account {
  const factory Account({
    final String? id,
    final String? name,
    final String? imageUrl,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}
