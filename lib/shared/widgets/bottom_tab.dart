import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/colors.dart';
import 'package:shoal_app/core/constants/icons.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/shared/providers/tab.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabProvider);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
              color: AppColor.kBottomNavigationBorderColor,
              width: 1,
              style: BorderStyle.solid),
        ),
      ),
      child: BottomNavigationBar(
          onTap: (index) => ref.read(tabProvider.notifier).onTabChange(index),
          currentIndex: currentIndex,
          selectedItemColor: AppColor.kBottomNavigationSelectedColor,
          unselectedItemColor: AppColor.kBottomNavigationUnselectedColor,
          unselectedIconTheme: const IconThemeData(
            color: AppColor.kBottomNavigationUnselectedColor,
          ),
          showUnselectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              label: AppContent.strHome,
              icon: AppIcon.iconHome,
            ),
            BottomNavigationBarItem(
              label: AppContent.strHistory,
              icon: AppIcon.iconHistory,
            ),
            BottomNavigationBarItem(
              label: AppContent.strWallet,
              icon: AppIcon.iconWallet,
            ),
            BottomNavigationBarItem(
              label: AppContent.strAccount,
              icon: AppIcon.iconSettings,
            ),
          ]),
    );
  }
}
