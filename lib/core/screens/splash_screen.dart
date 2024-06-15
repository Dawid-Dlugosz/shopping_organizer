import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(RouteNames.loginScreen);
    });
    super.initState();
  }

  // JEŚŁI SIĘ LOGUJE, POBIERAM UŻYTKOWNIKA
  // ROBIĘ UPDATE FCM, ROBIENIE FCM MOGĘ ZROBIĆ W POBIERANIU UŻYTWKONIKA, BĘDZIE LEPIEJ

  // JEŚLI TWORZE KONTO, TWORZĘ NOWEGO UŻYTKOWNIKA

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeMap(authorized: (value) {
          final customUserCubit = context.read<CustomUserCubit>();
          customUserCubit.getCustomUser(userId: value.user.uid);
          context.go(RouteNames.homeScreen);
        }, orElse: () {
          context.go(RouteNames.loginScreen);
        });
      },
      child: const Placeholder(),
    );
  }
}
