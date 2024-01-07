import 'package:flutter/material.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/config/theme/typography.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key, this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      // leading: IconButton(
      //   iconSize: 18.0,
      //   icon: const ImageIcon(
      //     AssetImage(
      //       AppImage.imgDrawerIcon,
      //     ),
      //     size: 18.0,
      //   ),
      //   onPressed: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      // ),

      title: textBodyLarge(
        context,
        color: AppColor.kBlack,
        label: title ?? '',
      ),
      actions: [
        // IconButton(
        //   onPressed: () {},
        //   icon: const ImageIcon(
        //     AssetImage(
        //       AppImage.imgNotificationIcon,
        //     ),
        //     size: 17.5,
        //   ),
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
