import 'package:go_router/go_router.dart';
import 'package:shoal_app/modules/auth/presenter/pages/login.dart';
import 'package:shoal_app/modules/home/presenter/pages/home.dart';
import 'package:shoal_app/modules/splash/presenter/pages/splash.dart';
import 'package:shoal_app/routes/route_utils.dart';
import 'package:shoal_app/routes/screen/page_not_foud.dart';

class AppRouter {

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
       GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
        path: PAGES.login.screenPath,
        builder: (context, state) => const LoginScreen(),
        ),
      GoRoute(
        path: PAGES.home.screenPath,
        builder: (context, state) => const HomeScreen(),
        ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    );

  static GoRouter get router => _router;
}