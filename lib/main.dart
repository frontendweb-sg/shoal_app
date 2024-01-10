import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/theme.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/core/session/session.dart';
import 'package:shoal_app/core/session/session_manager.dart';
import 'package:shoal_app/core/utils/storage_service.dart';
import 'package:shoal_app/globals.dart';
import 'package:shoal_app/modules/auth/presenter/pages/login.dart';
import 'package:shoal_app/modules/home/presenter/pages/home.dart';
import 'package:shoal_app/modules/splash/presenter/pages/splash.dart';
import 'package:shoal_app/shared/providers/session.dart';

import 'package:shoal_app/shared/providers/theme_riverpod.dart';

final gloablNavigatorKey = GlobalKey<NavigatorState>();
void main() async {
  // global cofiguration initialize

  // enableFlutterDriverExtension();

  await Global.init();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final StreamController streamController = StreamController();

  MyApp({super.key});

  void redirecToPage() {
    if (gloablNavigatorKey.currentContext != null) {
      Navigator.pop(gloablNavigatorKey.currentContext!);
      Navigator.pushReplacement(
        gloablNavigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    StorageService storageService = Global.storage;
    bool isFirstTime = storageService.userFirstTimeOpenApp();
    bool isToken = storageService.userIsAuthenticated;

    Widget screen = const SplashScreen();
    if (isFirstTime && !isToken) {
      screen = const LoginScreen();
    } else if (isToken) {
      screen = const HomeScreen();
    }

    if (gloablNavigatorKey.currentContext != null) {
      session.startListener(
        streamController: streamController,
        context: gloablNavigatorKey.currentContext!,
      );
    }

    return SessionManager(
      duration: const Duration(seconds: 10),
      onSessionExpired: () {
        if (gloablNavigatorKey.currentContext != null &&
            session.enableAuthPage == true) {
          print('session expired');
          ScaffoldMessenger.of(gloablNavigatorKey.currentContext!).showSnackBar(
            const SnackBar(
              content: Text('Session expired'),
            ),
          );
          storageService.logout();
          redirecToPage();
        }
      },
      streamController: streamController,
      child: MaterialApp(
        navigatorKey: gloablNavigatorKey,
        title: AppContent.strAppName,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ref.watch(themeProvider) ? ThemeMode.dark : ThemeMode.light,
        home: screen,
      ),
    );
  }
}
