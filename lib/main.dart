import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/config/theme/theme.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/core/utils/storage_service.dart';
import 'package:shoal_app/globals.dart';

import 'package:shoal_app/modules/auth/presenter/pages/login.dart';
import 'package:shoal_app/modules/home/presenter/pages/home.dart';
import 'package:shoal_app/modules/loan/presenter/pages/personal_detail.dart';
import 'package:shoal_app/modules/splash/presenter/pages/splash.dart';
import 'package:shoal_app/shared/providers/theme_riverpod.dart';

void main() async {
  // global cofiguration initialize
  await Global.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StorageService storageService = Global.storage;
    bool isFirstTime = storageService.userFirstTimeOpenApp();
    bool isToken = storageService.userIsAuthenticated;

    Widget screen = const SplashScreen();
    if (isFirstTime && !isToken) {
      screen = const LoginScreen();
    } else if (isToken) {
      screen = const HomeScreen();
    }

    return MaterialApp(
      title: AppContent.strAppName,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeProvider) ? ThemeMode.dark : ThemeMode.light,
      home: screen,
    );
  }
}
