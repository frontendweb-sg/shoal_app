import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:flutter/services.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        tooltip: "menu",
        iconSize: 18.0,
        icon: const ImageIcon(
          AssetImage(
            AppImage.imgDrawerIcon,
          ),
          size: 18.0,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),

      title: textBodyLarge(
        context,
        color: AppColor.kBlack,
        label: title ?? '',
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage(
              AppImage.imgNotificationIconPng,
            ),
            size: 17.5,
          ),
        ),
        const SizedBox(height: 20),
       IconButton(
        key: const ValueKey("close"),
        tooltip: "Close the app",
        onPressed: exitapp,
        icon: const Icon(Icons.close)
        ),
        FloatingActionButton
        (onPressed: exitapp,
        tooltip: "closeApp",
        key: const ValueKey("keyClose"),)
      ],
    );
  }

  void exitapp() {
     if (Platform.isIOS) {
                exit(0);
                } else {
                SystemNavigator.pop();
            }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
