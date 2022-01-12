import 'package:flutter/material.dart';
import 'package:spark/core/bloc/base_state/base_state.dart';
import 'package:spark/core/errors/connection_error.dart';
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

  ShowError._init();

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
          ShowError.showUnauthorizedError(context);
        } else if (baseError is BadRequestError) {
          ShowError.showBadRequestError(context);
        } else if (baseError is ForbiddenError) {
          ShowError.showForbiddenError(context);
        } else if (baseError is NotFoundError) {
          ShowError.showNotFoundError(context);
        } else if (baseError is ConflictError) {
          ShowError.showConflictError(context);
        } else if (baseError is TimeoutError) {
          ShowError.showTimeoutError(context);
        } else if (baseError is UnknownError) {
          ShowError.showUnknownError(context);
        } else if (baseError is InternalServerError) {
          ShowError.showInternalServerError(context);
        } else {
          ShowError.showUnexpectedError(context);
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

  static void showUnexpectedError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_general),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showUnauthorizedError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        S.of(context).error_Unauthorized_Error,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showBadRequestError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_BadRequest_Error),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showForbiddenError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        S.of(context).error_forbidden_error,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showInternalServerError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_internal_server),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showNotFoundError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_NotFound_Error),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showConflictError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_general),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showTimeoutError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_Timeout_Error),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showUnknownError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_general),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
