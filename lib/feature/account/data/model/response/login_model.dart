import 'dart:convert';

import 'package:spark/core/model/base_model.dart';

class LoginModel extends BaseModel<LoginModel>{
  final String? token;
  final AccountModel? account;

  LoginModel({
    this.account,
    this.token,
  });


  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    token: json["token"] == null ? null : json["token"],
  );

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
}