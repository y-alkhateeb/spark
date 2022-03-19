import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/resource.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback onProfilePressed;
  final VoidCallback onServicesPressed;
  final VoidCallback onNotificationPressed;
  final VoidCallback onChatPressed;
  final VoidCallback onSettingPressed;
  final VoidCallback onLogoutPressed;

  const DrawerWidget({
    Key? key,
    required this.onProfilePressed,
    required this.onServicesPressed,
    required this.onNotificationPressed,
    required this.onChatPressed,
    required this.onSettingPressed,
    required this.onLogoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Localizations.localeOf(context).languageCode ==
              ApplicationConstants.LANG_AR
          ? const BorderRadius.only(
              topLeft: const Radius.circular(25),
              bottomLeft: const Radius.circular(25))
          : const BorderRadius.only(
              topRight: const Radius.circular(25),
              bottomRight: const Radius.circular(25)),
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Gaps.vGap64,
            Image.asset(
              ApplicationConstants.IMAGE_LOGO,
              height: 100.h,
              width: 170.w,
            ),
            Gaps.vGap32,
            _DrawerListTile(
              title: S.of(context).label_profile,
              iconAsset: ApplicationConstants.IMAGE_DRAWER_PROFILE,
              onTap: () {
                closeDrawer(context);
                onProfilePressed();
              },
            ),
            _DrawerListTile(
              title: S.of(context).label_services,
              iconAsset: ApplicationConstants.IMAGE_DRAWER_SERVICES,
              onTap: () {
                closeDrawer(context);
                onServicesPressed();
              },
            ),
            _DrawerListTile(
                title: S.of(context).label_notifications,
                iconAsset: ApplicationConstants.IMAGE_DRAWER_NOTIFICATION,
                onTap: () {
                  closeDrawer(context);
                  onNotificationPressed();
                }),
            _DrawerListTile(
                title: S.of(context).label_chat,
                iconAsset: ApplicationConstants.IMAGE_DRAWER_CHAT,
                onTap: () {
                  closeDrawer(context);
                  onChatPressed();
                }),
            _DrawerListTile(
                title: S.of(context).label_setting,
                iconAsset: ApplicationConstants.IMAGE_DRAWER_SETTING,
                onTap: () {
                  closeDrawer(context);
                  onSettingPressed();
                }),
            _DrawerListTile(
                title: S.of(context).label_logout,
                iconAsset: ApplicationConstants.IMAGE_DRAWER_LOGOUT,
                onTap: () {
                  closeDrawer(context);
                  onLogoutPressed();
                }),
          ],
        ),
      ),
    );
  }

  void closeDrawer(BuildContext context) {
    if (Scaffold.of(context).isDrawerOpen) Scaffold.of(context).openEndDrawer();
  }
}

class _DrawerListTile extends StatelessWidget {
  final String title;
  final String iconAsset;
  final VoidCallback onTap;

  const _DrawerListTile({
    Key? key,
    required this.title,
    required this.iconAsset,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      selected: true,
      textColor: context.colors.secondary,
      iconColor: context.colors.primary,
      leading: ImageIcon(AssetImage(iconAsset)),
      onTap: onTap,
    );
  }
}
