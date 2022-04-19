import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:spark/core/common/resource.dart';
import 'package:spark/core/navigation/base_route.gr.dart';


@lazySingleton
class LoadingHelper {
  void showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: context.colors.primary,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
        status: "loading");
  }

  showLoadingView({Color? color}) {
    return Center(
      child: SpinKitFoldingCube(
        color: color ?? GetIt.I<AppRouter>().navigatorKey.currentContext!.colors.primary,
        size: 40.0,
      ),
    );
  }

  showCatLoadingView({Color? color}) {
    return Center(
      child: SpinKitRipple(
        color: color ?? GetIt.I<AppRouter>().navigatorKey.currentContext!.colors.primary,
        size: 40.0,
      ),
    );
  }

  void dismissDialog() {
    EasyLoading.dismiss();
  }
}
