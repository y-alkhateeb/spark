import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark/core/bloc/generic_cubit/generic_cubit.dart';

class GenericCubitWidget<T> extends StatefulWidget {
  const GenericCubitWidget({
    Key? key,
    required this.bloc,
    required this.builder,
  }) : super(key: key);

  final GenericBloc<T> bloc;
  final Widget Function(BuildContext context, T? data) builder;

  @override
  State<GenericCubitWidget<T>> createState() => _GenericCubitWidgetState<T>();
}

class _GenericCubitWidgetState<T> extends State<GenericCubitWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<T>, GenericState<T>>(
      bloc: widget.bloc,
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return widget.builder(context, state.data);
      },
    );
  }

  @override
  void dispose() {
    widget.bloc.close();
    super.dispose();
  }

}
