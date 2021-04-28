import 'package:dartz/dartz.dart';
import '../errors/base_error.dart';
import '../errors/unknown_error.dart';
import '../result/result.dart';

abstract class Repository{
  /// This method to check if the result is left or right and return it
  Result<BaseError, T> execute<T>({required
  Either<BaseError, T> remote}){
    if(remote.isLeft()){
      return Result.error((remote as Left<BaseError, T>).value);
    }
    if(remote.isRight()){
      return Result.data((remote as Right<BaseError, T>).value);
    }
    else return Result.error(UnknownError());
  }
}