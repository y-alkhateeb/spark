import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'generic_state.dart';

class GenericBloc<T> extends Cubit<GenericState<T>> {
  GenericBloc([T? data]) : super(GenericInitialState<T>(data));

  onUpdateData(T data){
    emit(GenericUpdateState<T>(data, !state.changed));
  }

  onUpdateToInitState(T data){
    emit(GenericInitialState<T>(data));
  }


}