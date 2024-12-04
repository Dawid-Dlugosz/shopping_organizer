import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:shopping_organizer/injectable_configure.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (getIt<FirebaseAuth>().currentUser == null) {
        
        context.go(RouteNames.loginScreen);
      } else {
        context.read<CustomUserCubit>().getCustomUser(userId: getIt<FirebaseAuth>().currentUser!.uid);
        context.go(RouteNames.shoppingList);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeMap(authorized: (value) {
          context.go(RouteNames.shoppingList);
        }, orElse: () {
          context.go(RouteNames.loginScreen);
        });
      },
      child: const Placeholder(),
    );
  }
}
