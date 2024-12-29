import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/core/screens/loading_screen.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _shoppingListIndex = 0;
const _expenseIndex = 1;

class HomePage extends StatelessWidget {
  const HomePage({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  void _createShoppingList(BuildContext context) {
    context.push<String?>(RouteNames.shoppingListForm).then((value) {
      if (value != null) {
        context.read<CustomUserCubit>().addShoppingList(shoppingListID: value);

        ScaffoldMessenger.of(context).clearSnackBars();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.addedShoppingList,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void _createExpense() {
    print('sasdssasd');
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
            loaded: (value) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Witaj ${value.customUser.nickname}',
                ),
                actions: [
                  IconButton(
                    onPressed: context.read<AuthCubit>().signOut,
                    icon: const Icon(
                      Icons.logout,
                    ),
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (_shoppingListIndex == navigationShell.currentIndex) {
                    _createShoppingList(context);
                  } else {
                    _createExpense();
                  }
                },
                child: const Icon(Icons.add),
              ),
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
              body: navigationShell,
            ),
          );
        },
      ),
    );
  }
}
