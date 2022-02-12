import 'dart:convert';

import 'package:spark/core/net/model/base_model.dart';

class LoginModel extends BaseModel<LoginModel>{
  final String? token;
  final AccountModel? account;

  LoginModel({
    this.account,
    this.token,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginModel &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          account == other.account;

  @override
  int get hashCode => token.hashCode ^ account.hashCode;

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    token: json["token"] == null ? null : json["token"],
  );

  @override
  String toString() {
    return 'LoginModel{token: $token, account: $account}';
  }

  @override
  Map<String, dynamic> toMap() => {
    "account": account == null ? null : account!.toMap(),
    "token": token == null ? null : token,
  };

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return LoginModel.fromMap(json);
  }
}

class AccountModel {
  AccountModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  factory AccountModel.fromJson(String str) => AccountModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountModel.fromMap(Map<String, dynamic> json) => AccountModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "imageUrl": imageUrl == null ? null : imageUrl,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode;

  @override
  String toString() {
    return 'AccountModel{id: $id, name: $name, imageUrl: $imageUrl}';
  }
}