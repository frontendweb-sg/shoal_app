import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/core/constants/images.dart';
import 'package:shoal_app/core/utils/model/menu.dart';
import 'package:shoal_app/modules/auth/presenter/pages/login.dart';
import 'package:shoal_app/shared/providers/theme_riverpod.dart';

class Sidebar extends ConsumerWidget {
  Sidebar({super.key});
  final List<Menu> menus = [
    Menu(
      id: 1,
      title: 'Personal info',
      childrens: [
        Menu(
          id: 01,
          title: 'Your profile',
          icon: const Icon(Icons.people),
        ),
        Menu(
          id: 02,
          title: 'History Transection',
          icon: const Icon(Icons.history),
        )
      ],
    ),
    Menu(
      id: 2,
      title: 'Security',
      childrens: [
        Menu(
          id: 21,
          title: 'Face Id',
          icon: const Icon(Icons.face),
        ),
        Menu(
          id: 22,
          title: 'Change password',
          icon: const Icon(Icons.password),
        )
      ],
    ),
    Menu(
      id: 3,
      title: 'General',
      childrens: [
        Menu(
          id: 31,
          title: 'Notification',
          icon: const Icon(Icons.notifications),
        ),
        Menu(
          id: 32,
          title: 'Languages',
          icon: const Icon(Icons.language),
        ),
        Menu(
          id: 33,
          title: 'Help & supports',
          icon: const Icon(Icons.help),
        )
      ],
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    return Drawer(
      key: const ValueKey("menu"),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          userHeader(context),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: sidebarMenu(context, menus),
          ),
          
          Tooltip(
            message: "logout",
            child: TextButton(           
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (bld) => const LoginScreen(),
                  ),
                );
                // Global.storage.logout();
                // if (!Global.storage.userIsAuthenticated) {
                //   Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(
                //       builder: (bld) => const LoginScreen(),
                //     ),
                //   );
                // }
              },
              child: const Text(
                "Logout",
              ),
            ),
          ),
          Text(
            'Last visited ${DateTime.now()}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColor.kRed,
                ),
          ),
          Switch(
            value: themeState,
            onChanged: (value) {
              themeNotifier.state = value;
            },
          )
        ],
      ),
    );
  }
}

UserAccountsDrawerHeader userHeader(BuildContext context) {
  return UserAccountsDrawerHeader(
    accountName: Text(
      "Pradeep Kumar",
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColor.kWhite),
    ),
    accountEmail: const Text("pradeep.kumar5@rsystems.com"),
    currentAccountPicture: ClipOval(
      child: Image.asset(
        AppImage.imgAvatarImg,
        fit: BoxFit.cover,
      ),
    ),
    decoration: const BoxDecoration(
      color: AppColor.kPrimaryColor,
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          AppImage.imgHomeScreenBg,
        ),
      ),
    ),
  );
}

Widget sidebarMenu(BuildContext context, List<Menu> menus) =>
    SingleChildScrollView(
      child: Column(
        children: menus
            .map(
              (menu) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    menu.title.toString(),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.kTextGray,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ...ListTile.divideTiles(
                    color: AppColor.kBorderColor,
                    context: context,
                    tiles: menu.childrens!
                        .map(
                          (e) => ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            onTap: () => e.onPressed!(context),
                            dense: true,
                            leading: e.icon,
                            title: Text(
                              e.title.toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
