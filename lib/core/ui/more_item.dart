import 'package:flutter/material.dart';
import '../common/resource.dart';

class MoreItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onPressed;

  const MoreItem({
    Key? key,
    required this.image,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          highlightColor: Colors.transparent,
          splashColor: context.colors.onSurface,
          onPressed: onPressed ?? () {},
          child: ListTile(
            // leading: Image.asset(
            //   image,
            //   color: context.colors.onSurface,
            //   height: 10,
            // ),
            title: Text(
              title,
              textScaleFactor: 1.0,
              style: context.textTheme.headline4,
            ),
          ),
        ),
        const Divider(
          indent: 1,
        ),
      ],
    );
  }
}
