import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return Scaffold(
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
    );
  }
}
