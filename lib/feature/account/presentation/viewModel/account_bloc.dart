import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:spark/core/errors/base_error.dart';
import 'package:spark/feature/account/data/model/request/login_request.dart';
import 'package:spark/feature/account/data/model/request/register_request.dart';
import 'package:spark/feature/account/data/model/response/login_model.dart';
import 'package:spark/feature/account/domain/repository/iaccount_repository.dart';
import 'package:spark/feature/account/domain/usecase/login_usecase.dart';
import 'package:spark/feature/account/domain/usecase/register_usecase.dart';
import 'package:get_it/get_it.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial());

  @override
  Stream<AccountState> mapEventToState(AccountEvent event,) async* {
    if (event is LoginAccountEvent) {
      AccountState state = LoginAccountState().waiting;
      yield state;
      final data = await LoginUseCase(GetIt.I<IAccountRepository>())(
          LoginRequest(
            cancelToken: event.loginRequest.cancelToken,
            phoneNumber: event.loginRequest.phoneNumber,
            email: event.loginRequest.email,
            password: event.loginRequest.password,
          )
      );
      print(data);
      data.pick(
        onData: (data){
          state = LoginAccountState(
            loginModel: data,
          );
        },
        onError: (error) {
          state = LoginAccountState(
            loginAccountFailure: AccountFailure(
                error,
                    () {
                  this.add(event);
                }
            )
          );
        },
        onErrorWithData: (data, error){
        }
      );
      yield state;
    }

    if (event is RegisterAccountEvent) {
      yield RegisterAccountWaiting();
      final _result = await RegisterUseCase(GetIt.I<IAccountRepository>())(
          RegisterRequest(
            firstName: event.registerRequest.firstName,
            lastName: event.registerRequest.lastName,
            cancelToken: event.registerRequest.cancelToken,
            phoneNumber: event.registerRequest.phoneNumber,
            email: event.registerRequest.email,
            password: event.registerRequest.password,
          )
      );
      _result.pick(
        onError: (error) async*{
          yield RegisterAccountGeneralFailure(
              error,
                  () {
                this.add(event);
              }
          );
        },
        onData: (data) async*{
          yield RegisterAccountSuccess();
        },
        onErrorWithData: (data, error){},
      );
    }

  }


}