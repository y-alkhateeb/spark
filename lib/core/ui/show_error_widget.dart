import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark/core/errors/cancel_error.dart';
import 'package:spark/core/errors/connection_error.dart';
import 'package:spark/generated/l10n.dart';
import '../common/gaps.dart';
import '../errors/bad_request_error.dart';
import '../errors/custom_error.dart';
import '../errors/forbidden_error.dart';
import '../errors/internal_server_error.dart';
import '../errors/not_found_error.dart';
import '../errors/timeout_error.dart';
import '../errors/unauthorized_error.dart';
import '../constants/app/app_constants.dart';

class ShowErrorWidget extends StatelessWidget {
  final dynamic state;

  ShowErrorWidget({Key? key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final error = state.error;
    {
      print(error);
      // Connection Error
      if (error is ConnectionError) {
        return ConnectionErrorScreenWidget(callback: state.callback);
      }
      // Custom Error
      else if (error is CustomError) {
        return CustomErrorScreenWidget(message: error.message);
      }
      // Unauthorized Error
      else if (error is UnauthorizedError) {
        return UnauthorizedErrorScreenWidget();
      }
      // Not Found Error
      else if (error is NotFoundError) {
        return NotFoundErrorScreenWidget(
          callback: state.callback,
        );
      }
      // Bad Request Error
      else if (error is BadRequestError) {
        return BadRequestErrorScreenWidget();
      }
      // Forbidden Error
      else if (error is ForbiddenError) {
        return ForbiddenErrorScreenWidget();
      }
      // Internal Server Error
      else if (error is InternalServerError) {
        return InternalServerErrorScreenWidget(
          callback: state.callback,
        );
      } else if (error is TimeoutError) {
        return TimeoutErrorScreenWidget(
          callback: state.callback,
        );
      }
      else if (error is CancelError) {
        return CustomErrorScreenWidget(message: error.message??S.of(context).error_cancel_token);
      }
    }
    return UnexpectedErrorScreenWidget(
      callback: state.callback,
    );
  }
}

class ConnectionErrorScreenWidget extends StatelessWidget {
  final VoidCallback callback;

  const ConnectionErrorScreenWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ApplicationConstants.ERROR_SERVER,
            scale: 2.5,
          ),
          Gaps.vGap32,
          Text(
            S.of(context).error_connection,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Gaps.vGap32,
          RaisedButton(
            onPressed: callback,
            child: Text(S.of(context).btn_Rty_title,
              style: TextStyle(fontSize: 12.5, color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}

class InternalServerErrorScreenWidget extends StatelessWidget {
  final VoidCallback callback;

  const InternalServerErrorScreenWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ApplicationConstants.ERROR_SERVER,
            scale: 2.5,
          ),
          Gaps.vGap32,
          Text(S.of(context).error_internal_server,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Gaps.vGap32,
          RaisedButton(
            onPressed: callback,
            child: Text(
              S.of(context).btn_Rty_title,
              style: TextStyle(fontSize: 12.5, color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}

class ForbiddenErrorScreenWidget extends StatefulWidget {
  @override
  _ForbiddenErrorScreenWidgetState createState() => _ForbiddenErrorScreenWidgetState();
}

class _ForbiddenErrorScreenWidgetState extends State<ForbiddenErrorScreenWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const SizedBox(),
      ),
    );
  }
}

class BadRequestErrorScreenWidget extends StatelessWidget {
  final String? message;

  const BadRequestErrorScreenWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ApplicationConstants.ERROR_INVALID,
            scale: 2.5,
          ),
          Gaps.vGap32,
          Text(
            message ?? S.of(context).error_BadRequest_Error,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class NotFoundErrorScreenWidget extends StatelessWidget {
  final VoidCallback callback;

  const NotFoundErrorScreenWidget({Key? key, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ApplicationConstants.ERROR_SERVER,
            scale: 2.5,
          ),
          Gaps.vGap32,
          Text(S.of(context).error_NotFound_Error,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Gaps.vGap32,
          RaisedButton(
            onPressed: callback,
            child: Text(S.of(context).btn_Rty_title,
              style: TextStyle(fontSize: 12.5, color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}

class UnauthorizedErrorScreenWidget extends StatefulWidget {
  @override
  _UnauthorizedErrorScreenWidgetState createState() => _UnauthorizedErrorScreenWidgetState();
}

class _UnauthorizedErrorScreenWidgetState extends State<UnauthorizedErrorScreenWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const SizedBox(),
      ),
    );
  }
}

class CustomErrorScreenWidget extends StatelessWidget {
  final String message;
  final VoidCallback? callback;

  const CustomErrorScreenWidget({
    Key? key,
    required this.message,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ApplicationConstants.ERROR_UNKNOWING,
            scale: 2.5,
          ),
          Gaps.vGap32,
          Text(
            message,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Gaps.vGap32,
          callback == null
              ? Container()
              : RaisedButton(
            onPressed: callback,
            child: Text(
              S.of(context).btn_Rty_title,
              style: TextStyle(fontSize: 12.5, color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}

class UnexpectedErrorScreenWidget extends StatelessWidget {
  final VoidCallback callback;

  const UnexpectedErrorScreenWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ApplicationConstants.ERROR_UNKNOWING,
            scale: 2.5,
          ),
          Gaps.vGap32,
          Text(
            S.of(context).error_general,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Gaps.vGap32,
          RaisedButton(
            onPressed: callback,
            child: Text(
              S.of(context).btn_Rty_title,
              style: TextStyle(fontSize: 12.5, color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}

class TimeoutErrorScreenWidget extends StatelessWidget {
  final VoidCallback callback;

  const TimeoutErrorScreenWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            ApplicationConstants.ERROR_TIMEOUT,
            scale: 2.5,
          ),
          Gaps.vGap32,
          Text(
            S.of(context).error_Timeout_Error,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Gaps.vGap32,
          RaisedButton(
            onPressed: callback,
            child: Text(
              S.of(context).btn_Rty_title,
              style: TextStyle(fontSize: 12.5, color: Colors.white),
            ),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
