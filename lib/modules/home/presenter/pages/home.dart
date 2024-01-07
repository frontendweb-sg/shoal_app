import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/modules/account/presenter/pages/setting_screen.dart';
import 'package:shoal_app/modules/history/presenter/pages/history_screen.dart';
import 'package:shoal_app/modules/home/presenter/widgets/home_content.dart';
import 'package:shoal_app/modules/wallet/presenter/pages/wallet_screen.dart';
import 'package:shoal_app/shared/providers/tab.dart';
import 'package:shoal_app/shared/widgets/bottom_tab.dart';
import 'package:shoal_app/shared/widgets/navbar.dart';
import 'package:shoal_app/shared/widgets/sidebar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTabIndex = ref.watch(tabProvider);

    Widget screen = const HomeScreenContent();

    if (currentTabIndex == 1) screen = const HistoryScreen();
    if (currentTabIndex == 2) screen = const WalletScreen();
    if (currentTabIndex == 3) screen = const AccountScreen();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const Navbar(
        title: AppContent.strHomeText,
      ),
      drawer: Sidebar(),
      body: screen,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
