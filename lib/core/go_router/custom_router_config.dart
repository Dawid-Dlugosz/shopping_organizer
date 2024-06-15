import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/core/screens/splash_screen.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/login_page.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/register_page.dart';
import 'package:shopping_organizer/features/home_page/presentation/screens/home_page.dart';
import 'package:shopping_organizer/features/home_page/presentation/screens/pages/expanses.dart';
import 'package:shopping_organizer/features/home_page/presentation/screens/pages/shopping_lists.dart';

class CustomRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorShoppingListKey =
      GlobalKey<NavigatorState>(debugLabel: 'shopList');
  static final _shellNavigatorExpansesKey =
      GlobalKey<NavigatorState>(debugLabel: 'expenses');

  static final GoRouter routers = GoRouter(
    navigatorKey: _rootNavigatorKey,
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
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => HomePage(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorShoppingListKey,
            routes: [
              GoRoute(
                path: RouteNames.shoppingList,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ShopngLists(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorExpansesKey,
            routes: [
              GoRoute(
                path: RouteNames.expanses,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Expanses(),
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
