import 'package:go_router/go_router.dart';
import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/core/screens/splash_screen.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/login_page.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/register_page.dart';

class CustomRouter {
  static final GoRouter routers = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.loginScreen,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.registerScreen,
        builder: (context, state) => const RegisterPage(),
      )
    ],
  );
}
