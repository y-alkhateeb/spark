import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../errors/base_error.dart';
import 'base_state.dart';

class BaseBloc<T> extends Cubit<BaseState<T>> {
  BaseBloc([T? data]) : super(data != null? BaseState.success(data): BaseState.init());

  T? get data => state.maybeWhen(orElse: ()=> null, success: (data)=> data);

  runLoadingState(){
    emit(BaseState.loading());
  }

  onUpdateData([T? data]){
    emit(BaseState.success(data));
  }

  onUpdateToFailedState(BaseError error, VoidCallback callback){
    emit(BaseState.failure(error, callback));
  }

}