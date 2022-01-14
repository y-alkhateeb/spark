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
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: onPressed ?? () {},
          child: ListTile(
            // leading: Image.asset(
            //   image,
            //   color: context.colors.onSurface,
            //   height: 10,
            // ),
            title: Text(
              title,
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
