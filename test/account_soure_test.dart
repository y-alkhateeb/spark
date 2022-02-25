// Annotation which generates the cat.mocks.dart library and the MockCat class.
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spark/core/errors/bad_request_error.dart';
import 'package:spark/core/net/net.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/datasources/account_remote.dart';
import 'package:spark/feature/account/data/datasources/iaccount_remote.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});


  GetIt.I.registerSingleton(HttpClient(
      BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        sendTimeout: 10000,
        responseType: ResponseType.json,
        baseUrl: "https://reqres.in/api/",
      )
  ));
  late IAccountRemoteSource iAccountRemoteSource;

  setUp((){
    iAccountRemoteSource = AccountRemoteSource();
  });
  // Verify the interaction.
  test("login with phone should be return error BadRequestError", () async {
    final response = await iAccountRemoteSource.login(
        LoginRequest(
            phoneNumber: "eve.holt@reqres.in",
            password: "cityslicka",
            cancelToken: CancelToken()),
    );
    expect(response, MyResult<LoginModel>.isError(BadRequestError()));
  });


  test("login with email should be return success", () async {
    final response = await iAccountRemoteSource.login(
      LoginRequest(
          email: "eve.holt@reqres.in",
          password: "cityslicka",
          cancelToken: CancelToken()),
    );
    expect(response, MyResult<LoginModel>.isSuccess(LoginModel(token: "QpwL5tke4Pnpja7X4")));
  });

}
