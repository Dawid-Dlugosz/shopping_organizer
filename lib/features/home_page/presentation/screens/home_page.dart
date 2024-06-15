import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_organizer/core/screens/loading_screen.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:shopping_organizer/injectable_configure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomUserCubit, CustomUserState>(
      listener: (context, state) {
        state.mapOrNull(
          initial: (_) => context.read<AuthCubit>().signOut(),
          error: (_) => context.read<AuthCubit>().signOut(),
        );
      },
      child: BlocBuilder<CustomUserCubit, CustomUserState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => const LoadingScreen(),
            loaded: (_) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.list_alt),
                    label: AppLocalizations.of(context)!.shoppingLists,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.monetization_on),
                    label: AppLocalizations.of(context)!.expanses,
                  ),
                ],
                currentIndex: navigationShell.currentIndex,
                onTap: _goBranch,
              ),
              body: Column(
                children: [
                  Text(getIt<FirebaseAuth>().currentUser?.uid ?? ''),
                  navigationShell,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
