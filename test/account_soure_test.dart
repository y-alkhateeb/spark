// Annotation which generates the cat.mocks.dart library and the MockCat class.
import 'package:dio/src/cancel_token.dart';
import 'package:dio/src/options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:mockito/mockito.dart';
import 'package:spark/core/constants/enums/http_method.dart';
import 'package:spark/core/errors/base_error.dart';
import 'package:spark/core/errors/unknown_error.dart';
import 'package:spark/core/net/model/base_model.dart';
import 'package:spark/core/result/result.dart';
import 'package:spark/feature/account/data/datasources/iaccount_remote.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';

class MockIAccountRemoteSource extends Mock implements IAccountRemoteSource{
  @override
  // TODO: implement authToken
  Future<String?> get authToken => throw UnimplementedError();

  @override
  Future<void> deleteFcmToken() {
    // TODO: implement deleteFcmToken
    throw UnimplementedError();
  }

  @override
  Future<void> deleteToken() {
    // TODO: implement deleteToken
    throw UnimplementedError();
  }

  @override
  // TODO: implement fcmToken
  Future<String?> get fcmToken => throw UnimplementedError();

  @override
  // TODO: implement hasFcmToken
  Future<bool> get hasFcmToken => throw UnimplementedError();

  @override
  // TODO: implement hasToken
  Future<bool> get hasToken => throw UnimplementedError();

  @override
  Future<Result<BaseError, LoginModel>> login(LoginRequest loginRequest) async{
    return await Result.error(UnknownError());
  }

  @override
  Future<void> persistFcmToken(String token) {
    // TODO: implement persistFcmToken
    throw UnimplementedError();
  }

  @override
  Future<void> persistToken(String token) {
    // TODO: implement persistToken
    throw UnimplementedError();
  }

  @override
  Future<Result<BaseError, RegisterModel>> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Result<BaseError, TModel>> request<TModel extends BaseModel, TResponse>({required TResponse Function(dynamic p1) converter, required HttpMethod method, required String url, TModel? model, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body, bool withAuthentication = false, required CancelToken cancelToken}) {
    // TODO: implement request
    throw UnimplementedError();
  }

  @override
  Future<Result<BaseError, TModel>> requestUploadFile<TModel, TResponse>({required TResponse Function(dynamic p1) converter, required String url, required String fileKey, required String filePath, required MediaType mediaType, Map<String, dynamic>? data, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress, bool withAuthentication = false, bool withTenants = false, required CancelToken cancelToken}) {
    // TODO: implement requestUploadFile
    throw UnimplementedError();
  }

}

class MockIAccountRepository extends Mock implements IAccountRepository{
  final MockIAccountRemoteSource _mockIAccountRemoteSource;

  MockIAccountRepository(this._mockIAccountRemoteSource);
  @override
  // TODO: implement authToken
  Future<String?> get authToken => throw UnimplementedError();

  @override
  Future<void> deleteFcmToken() {
    // TODO: implement deleteFcmToken
    throw UnimplementedError();
  }

  @override
  Future<void> deleteToken() {
    // TODO: implement deleteToken
    throw UnimplementedError();
  }

  @override
  // TODO: implement fcmToken
  Future<String?> get fcmToken => throw UnimplementedError();

  @override
  // TODO: implement hasFcmToken
  Future<bool> get hasFcmToken => throw UnimplementedError();

  @override
  // TODO: implement hasToken
  Future<bool> get hasToken => throw UnimplementedError();

  @override
  Future<Result<BaseError, LoginModel>> login(LoginRequest loginRequest) async{
    final result =  await _mockIAccountRemoteSource.login(loginRequest);
    return result.fold(
            (error) => Result.error(UnknownError()),
            (data) => Result.data(LoginModel())
    );
  }

  @override
  Future<void> persistFcmToken(String token) {
    // TODO: implement persistFcmToken
    throw UnimplementedError();
  }

  @override
  Future<void> persistToken(String token) {
    // TODO: implement persistToken
    throw UnimplementedError();
  }

  @override
  Future<Result<BaseError, RegisterModel>> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }

}
void main() {
  var mockAccount = MockIAccountRemoteSource();
  var mockIAccountRepository = MockIAccountRepository(mockAccount);
  // Verify the interaction.
  test("description", () async {
    expect(await mockIAccountRepository.login(
        LoginRequest(email: "",password: "",phoneNumber: "",cancelToken: CancelToken())),
        Result.data(LoginModel()));
  });
}
