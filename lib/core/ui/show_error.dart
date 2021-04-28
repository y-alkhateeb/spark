import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spark/core/errors/connection_error.dart';
import 'package:spark/generated/l10n.dart';
import '../errors/bad_request_error.dart';
import '../errors/base_error.dart';
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
      BuildContext context, BaseError error, dynamic state,
      {ScaffoldState? scaffoldState}) {
    if (error is ConnectionError) {
      ShowError.showConnectionError(
        context,
        state != null && state.callback != null ? state.callback : () {},
      );
    } else if (error is CustomError) {
      ShowError.showCustomError(context, error.message);
    } else if (error is UnauthorizedError) {
      ShowError.showUnauthorizedError(context);
    } else if (error is BadRequestError) {
      ShowError.showBadRequestError(context);
    } else if (error is ForbiddenError) {
      ShowError.showForbiddenError(context);
    } else if (error is NotFoundError) {
      ShowError.showNotFoundError(context);
    } else if (error is ConflictError) {
      ShowError.showConflictError(context);
    } else if (error is TimeoutError) {
      ShowError.showTimeoutError(context);
    } else if (error is UnknownError) {
      ShowError.showUnknownError(context);
    } else if (error is InternalServerError) {
      ShowError.showInternalServerError(context);
    } else {
      ShowError.showUnexpectedError(context);
    }
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
    Scaffold.of(context).showSnackBar(
      snackBar,
    );
  }

  static void showCustomError(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showUnexpectedError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_general),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showUnauthorizedError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        S.of(context).error_Unauthorized_Error,
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showBadRequestError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_BadRequest_Error),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showForbiddenError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        S.of(context).error_forbidden_error,
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showInternalServerError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_internal_server),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showNotFoundError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_NotFound_Error),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showConflictError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_general),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showTimeoutError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_Timeout_Error),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void showUnknownError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(S.of(context).error_general),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
