import '../result/result.dart';

import '../params/base_params.dart';

import '../errors/base_error.dart';

abstract class UseCase<Type, Params extends BaseParams> {
  Future<Result<BaseError, Type>> call(Params params);
}
