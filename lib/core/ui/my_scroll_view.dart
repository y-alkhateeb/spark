import 'package:flutter/material.dart';

class MyScrollView extends StatelessWidget {

  const MyScrollView({
    Key? key,
    required this.children,
    this.padding,
    this.physics = const BouncingScrollPhysics(),
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.bottomButton,
    this.tapOutsideToDismiss = false,
    this.overScroll = 16.0,
  }): super(key: key);

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final CrossAxisAlignment? crossAxisAlignment;
  final Widget? bottomButton;
  final bool? tapOutsideToDismiss;
  final double? overScroll;

  @override
  Widget build(BuildContext context) {

    Widget contents = Column(
      crossAxisAlignment: crossAxisAlignment!,
      children: children,
    );


      contents = SingleChildScrollView(
        padding: padding,
        physics: physics,
        child: contents,
      );


    if (bottomButton != null) {
      contents = Column(
        children: <Widget>[
          Expanded(
              child: contents
          ),
          SafeArea(
              child: bottomButton!
          )
        ],
      );
    }

    return contents;
  }
}