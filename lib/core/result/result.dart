import '../errors/base_error.dart';

class Result<Error extends BaseError, Data> {
  final Data? data;
  final Error? error;

  Result({this.data, this.error}) : assert(data != null || error != null);

  /// checks whether data is available
  bool get hasDataOnly => data != null && error == null;

  /// checks whether an error is present
  bool get hasErrorOnly => data == null && error != null;

  @override
  String toString() {
    return 'Result{data: $data, error: $error}';
  }

  /// checks whether data and error is present
  /// error from network data source and data from cache data source
  bool get hasDataAndError => data != null && error != null;

  /// returns the error
  factory Result.error(Error error) {
    return Result(
      error: error,
      data: null,
    );
  }

  /// returns just data
  factory Result.data(Data? data) {
    return Result(
      error: null,
      data: data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Result && runtimeType == other.runtimeType && data == other.data && error == other.error;

  @override
  int get hashCode => data.hashCode ^ error.hashCode;

  /// returns error and data
  factory Result.dataWithError(Data? data,Error error) {
    return Result(
      error: error,
      data: data,
    );
  }

  /// forwards the error if present else forwards the data
  factory Result.forward(Result _result, Data? data) {
    if (_result.hasErrorOnly) {
      return Result.error(_result.error as Error);
    }

    return Result.data(data);
  }


  /// Cherry pick values
  ///
  /// onError will return error, if present
  /// onNoError will return data if error is not present
  /// onData will return data if data is available
  /// onDataWithError will return data if error is present and data is available
  void pick({
    Function(Error error)? onError,
    Function(Data data)? onData,
    Function(Data data, Error error)? onErrorWithData,
  }) {
    if (hasErrorOnly) {
      if (onError != null) {
        onError(error!);
      }
    }

    else if (hasDataOnly) {
      if (onData != null) {
        onData(data!);
      }
    }

    else if (onErrorWithData != null) {
      onErrorWithData(data!, error!);
    }
  }
}