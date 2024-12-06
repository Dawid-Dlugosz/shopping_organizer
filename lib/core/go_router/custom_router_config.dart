import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/core/screens/splash_screen.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/login_page.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/register_page.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/cubits/shopping_list_cubit.dart';
import 'package:shopping_organizer/features/create_shopping_list/presentation/screens/shoppig_list_form.dart';
import 'package:shopping_organizer/features/home_page/home_page.dart';
import 'package:shopping_organizer/features/home_page/widgets/expanses.dart';
import 'package:shopping_organizer/features/home_page/widgets/shopping_lists.dart';
import 'package:shopping_organizer/injectable_configure.dart';

class CustomRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorShoppingListKey =
      GlobalKey<NavigatorState>(debugLabel: 'shopList');
  static final _shellNavigatorExpansesKey =
      GlobalKey<NavigatorState>(debugLabel: 'expenses');

  GoRouter routers(ValueNotifier<AuthState> notifier) {
    return GoRouter(
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
        GoRoute(
          path: RouteNames.shoppingListForm,
          builder: (context, state) => BlocProvider(
            create: (context) =>
                getIt<ShoppingListCubit>()..createNewShoppingList(),
            child: const ShoppingListForm(),
          ),
        ),
      ],
      refreshListenable: notifier,
      redirect: (context, state) {
        final authState = context.read<AuthCubit>().state;

        return authState.maybeMap(
          authorized: (_) => null,
          orElse: () => RouteNames.loginScreen,
        );
      },
    );
  }
}
