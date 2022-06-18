part of 'generic_cubit.dart';

abstract class GenericState<T> extends Equatable {
  final T? data;
  final bool changed;
  const GenericState(this.data, this.changed);
}

class GenericInitialState<T> extends GenericState<T> {
  GenericInitialState(T? data) : super(data, false);

  @override
  List<Object> get props => [changed];
}


class GenericUpdateState<T> extends GenericState<T> {
  GenericUpdateState(T? data, bool changed) : super(data, changed);

  @override
  List<Object> get props => [changed];
}