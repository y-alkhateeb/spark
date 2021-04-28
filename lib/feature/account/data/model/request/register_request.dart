import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spark/core/params/base_params.dart';

class RegisterRequest extends BaseParams{
  RegisterRequest({
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.phoneNumber,
    this.email,
    this.password,
    CancelToken? cancelToken
  }): super(cancelToken: cancelToken!);

  final String? firstName;
  final String? lastName;
  final int? gender;
  final String? birthDate;
  final String? phoneNumber;
  final String? email;
  final String? password;

  factory RegisterRequest.fromJson(String str) => RegisterRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequest.fromMap(Map<String, dynamic> json) => RegisterRequest(
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    gender: json["gender"] == null ? null : json["gender"],
    birthDate: json["birthDate"] == null ? null : json["birthDate"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toMap() => {
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "gender": gender == null ? null : gender,
    "birthDate": birthDate == null ? null : birthDate,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
  };
}
