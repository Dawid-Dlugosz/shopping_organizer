import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/core/screens/splash_screen.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/login_page.dart';
import 'package:shopping_organizer/features/auth/presentation/screen/register_page.dart';
import 'package:shopping_organizer/injectable_configure.dart';

class _FirebaseAuthListener extends ChangeNotifier {
  _FirebaseAuthListener(AuthCubit cubit, BuildContext context) {
    _streamSubscription = cubit.stream.listen((event) {
      if (event != _lastState) {
        _lastState = event;

        notifyListeners();
      }
    });
  }

  StreamSubscription? _streamSubscription;
  AuthState? _lastState;

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}

class CustomRouter {
  static GoRouter routers(BuildContext context) => GoRouter(
        initialLocation: '/',
        refreshListenable: _FirebaseAuthListener(
          getIt<AuthCubit>(),
          context,
        ),
        redirect: _checkAuthorization,
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

  static String? _checkAuthorization(
    BuildContext context,
    GoRouterState state,
  ) =>
      context.read<AuthCubit>().state.mapOrNull(
            unAuthorized: (_) => RouteNames.loginScreen,
          );
}
