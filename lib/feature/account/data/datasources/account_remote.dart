import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:spark/core/constants/enums/http_method.dart';
import 'package:spark/core/net/api_url.dart';
import 'package:spark/core/net/http_client.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/data/model/response/register_model.dart';

import '../../../../core/result/result.dart';
import 'iaccount_remote.dart';


@Injectable(as: IAccountRemoteSource)
class AccountRemoteSource implements IAccountRemoteSource{

  @override
  Future<MyResult<LoginModel>> login(LoginRequest loginRequest) async {
    return await GetIt.I<HttpClient>().request<LoginModel>(
      converter: (json) => LoginModel.fromJson(json),
      isShowDialog: true,
      method: HttpMethod.POST,
      url: ApiUrl.LOGIN_URL,
      body: loginRequest.toMap(),
      cancelToken: loginRequest.cancelToken,
    );
  }


  @override
  Future<MyResult<RegisterModel>> register(
      RegisterRequest registerRequest) async {
    return await GetIt.I<HttpClient>().request<RegisterModel>(
      converter: (json) => RegisterModel.fromJson(json),
      method: HttpMethod.POST,
      isShowDialog: true,
      url: ApiUrl.REGISTER_URL,
      body: registerRequest.toMap(),
      cancelToken: registerRequest.cancelToken,
    );
  }

}