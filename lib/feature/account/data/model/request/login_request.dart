import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../../core/params/base_params.dart';

class LoginRequest extends BaseParams{
  LoginRequest({
    this.phoneNumber,
    this.email,
    this.password,
    CancelToken? cancelToken
  }): super(cancelToken: cancelToken!);

  final String? phoneNumber;
  final String? email;
  final String? password;


  Map<String, dynamic> toMap() => {
    // "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
  };
}