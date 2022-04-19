import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import '../common/appConfig.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final double? size;
  final bool? showBack;
  final bool? centerTitle;

  const MyAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
    this.leading,
    this.size,
    this.showBack = true,
    this.centerTitle,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MyText(
        title: title,
        size: 18,
        color: AppConfig().currentTheme.colorScheme.onBackground,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: centerTitle??true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: showBack == true ? 55 : 10,
      leading: leading ??
          Visibility(
            visible: showBack ?? true,
            child: IconButton(
              icon: SvgPicture.asset("Res.arrow"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size ?? 65);
}
