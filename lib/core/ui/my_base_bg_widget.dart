import 'package:spark/core/common/resource.dart';
import 'package:flutter/material.dart';

class MyBaseBgWidget extends StatelessWidget {
  final Widget child;
  const MyBaseBgWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.secondary.withOpacity(0.2),
          image: DecorationImage(
              image: ExactAssetImage(ApplicationConstants.IMAGE_BACKGROUND),
              fit: BoxFit.cover,
              opacity: 0.4
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: child,
        ),
      ),
    );
  }
}
