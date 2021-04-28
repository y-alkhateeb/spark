import 'dart:convert';

class LoginModel{
  final String? token;
  final AccountModel? account;

  LoginModel({
    required this.account,
    required this.token,
  });

  factory LoginModel.fromJson(String str) => LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    account: json["account"] == null ? null : AccountModel.fromMap(json["account"]),
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toMap() => {
    "account": account == null ? null : account!.toMap(),
    "token": token == null ? null : token,
  };
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