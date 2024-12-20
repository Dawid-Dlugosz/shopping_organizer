import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_organizer/core/screens/loading_screen.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';

class CustomUserBuilder extends StatelessWidget {
  const CustomUserBuilder({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomUserCubit, CustomUserState>(
        builder: (context, state) {
      return state.maybeMap(
        loaded: (value) {
          return child;
        },
        loading: (_) => const LoadingScreen(),
        orElse: () {
          context.read<AuthCubit>().signOut();
          return const LoadingScreen();
        },
      );
    });
  }
}
