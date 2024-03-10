import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
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
        context.go(RouteNames.shoppingList);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
