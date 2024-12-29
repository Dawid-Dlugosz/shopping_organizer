import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/core/screens/splash_screen.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/login_page.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/register_page.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/cubits/shopping_create_list_cubit.dart';
import 'package:shopping_organizer/features/shopping_list/create_shopping_list/presentation/screens/shopping_create_page.dart';
import 'package:shopping_organizer/features/custom_user/presentation/widgets/custom_user_builder.dart';
import 'package:shopping_organizer/features/home_page/home_page.dart';
import 'package:shopping_organizer/features/home_page/pages/expanses.dart';
import 'package:shopping_organizer/features/home_page/pages/shopping_lists_page.dart';
import 'package:shopping_organizer/features/shopping_list/get_shopping_lists/presentation/cubit/shopping_list_cubit.dart';
import 'package:shopping_organizer/injectable_configure.dart';

class CustomRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorShoppingListKey =
      GlobalKey<NavigatorState>(debugLabel: 'shopList');
  static final _shellNavigatorExpansesKey =
      GlobalKey<NavigatorState>(debugLabel: 'expenses');

  static GoRouter routers(ValueNotifier<AuthState> notifier) {
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
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (_) => getIt<ShoppingCreateListCubit>(),
                        ),
                        BlocProvider(
                          create: (_) =>
                              getIt<ShoppingListCubit>()..listListener(),
                        ),
                      ],
                      child: const CustomUserBuilder(
                        child: ShopngListsPage(),
                      ),
                    ),
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
                getIt<ShoppingCreateListCubit>()..createNewShoppingList(),
            child: const ShoppingCreatePage(),
          ),
        ),
      ],
      refreshListenable: notifier,
      redirect: (context, state) {
        if (state.fullPath != RouteNames.registerScreen) {
          final authState = context.read<AuthCubit>().state;
          return authState.maybeMap(
            unAuthorized: (_) => RouteNames.loginScreen,
            orElse: () => null,
          );
        }
      },
    );
  }
}
