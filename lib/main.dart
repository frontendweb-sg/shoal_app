import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoal_app/config/theme/theme.dart';
import 'package:shoal_app/core/i18n/contents.dart';
import 'package:shoal_app/core/utils/storage_service.dart';
import 'package:shoal_app/globals.dart';
import 'package:shoal_app/modules/auth/presenter/pages/login.dart';
import 'package:shoal_app/modules/home/presenter/pages/home.dart';
import 'package:shoal_app/modules/splash/presenter/pages/splash.dart';
import 'package:shoal_app/shared/providers/theme_riverpod.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:shoal_app/shared/widgets/session_listener.dart';

void main() async {
  // global cofiguration initialize
  // enableFlutterDriverExtension();
  await Global.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final _navigatorKey = GlobalKey<NavigatorState>();

  Future<void> timedOut() async {
    await showDialog(
      context: _navigatorKey.currentState!.overlay!.context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Session Time out Alert!'),
        content: const Text(
            'Sorry but you have been logged out due to inactivity...'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
            child: const Text('Cancle'),
          ),
          TextButton(
            onPressed: () {
             Navigator.pop(context);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StorageService storageService = Global.storage;
    bool isFirstTime = storageService.userFirstTimeOpenApp();
    bool isToken = storageService.userIsAuthenticated;
    // bool isToken = true;

    Widget screen = const SplashScreen();
    if (isFirstTime && !isToken) {
      screen = const LoginScreen();
    } else if (isToken) {
      screen = const HomeScreen();
    }

    return SessionTimeoutListener(
      duration: const Duration(seconds: 20),
      onTimeOut: () {
        if (isToken) {
          timedOut();
        }             
      },
      child: MaterialApp(
        navigatorKey: _navigatorKey,
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
