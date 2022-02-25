import 'package:flutter/material.dart';
import 'package:spark/core/bloc/base_state/base_state.dart';
import 'package:spark/core/errors/connection_error.dart';
import 'package:spark/core/errors/socket_error.dart';
import 'package:spark/generated/l10n.dart';
import '../errors/bad_request_error.dart';
import '../errors/conflict_error.dart';
import '../errors/custom_error.dart';
import '../errors/forbidden_error.dart';
import '../errors/internal_server_error.dart';
import '../errors/not_found_error.dart';
import '../errors/timeout_error.dart';
import '../errors/unauthorized_error.dart';
import '../errors/unknown_error.dart';

class ShowError {

  static void showErrorSnakBar(
      BuildContext context, BaseState baseFailureState,
      {ScaffoldState? scaffoldState}) {
    baseFailureState.maybeWhen(
        orElse: (){},
      failure: (baseError, callback){
        if (baseError is ConnectionError) {
          ShowError.showConnectionError(
            context,
            callback,
          );
        } else if (baseError is CustomError) {
          ShowError.showCustomError(context, baseError.message);
        } else if (baseError is UnauthorizedError) {
          ShowError.showCustomError(context, baseError.toString());
        } else if (baseError is BadRequestError) {
          ShowError.showCustomError(context, baseError.toString());
        } else if (baseError is ForbiddenError) {
          ShowError.showCustomError(context, baseError.toString());
        } else if (baseError is NotFoundError) {
          ShowError.showCustomError(context, baseError.toString());
        } else if (baseError is ConflictError) {
          ShowError.showCustomError(context, baseError.toString());
        } else if (baseError is TimeoutError) {
          ShowError.showCustomError(context, baseError.toString());
        } else if (baseError is UnknownError) {
          ShowError.showCustomError(context, baseError.toString());
        } else if (baseError is InternalServerError) {
          ShowError.showCustomError(context, baseError.toString());
        } else if (baseError is SocketError) {
          ShowError.showCustomError(context,baseError.toString());
        }else {
          ShowError.showCustomError(context, baseError.toString());
        }
      }
    );
  }

  static void showConnectionError(BuildContext context, VoidCallback callback) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_connection_lost),
      action: SnackBarAction(
        label: S.of(context).btn_Rty_title,
        onPressed: () {
          callback();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  static void showCustomError(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
