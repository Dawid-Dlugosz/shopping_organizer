import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:shopping_organizer/core/custom_theme.dart';
import 'package:shopping_organizer/core/go_router/custom_router_config.dart';
import 'package:shopping_organizer/core/widgets/custom_multi_bloc_provider.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/firebase_options.dart';
import 'package:shopping_organizer/injectable_configure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();

  // Initialize AuthCubit and ValueNotifier before the app starts
  final authCubit = getIt<AuthCubit>(); // Assuming you're using getIt for DI
  final notifier = ValueNotifier<AuthState>(authCubit.state);

  // Update notifier on AuthCubit state changes
  authCubit.stream.listen((state) {
    notifier.value = state;
  });

  // Initialize the router once and reuse it
  final router = CustomRouter.routers(notifier);

  runApp(MyApp(authCubit: authCubit, notifier: notifier, router: router));
}

class MyApp extends StatelessWidget {
  final AuthCubit authCubit;
  final ValueNotifier<AuthState> notifier;
  final GoRouter router;

  const MyApp({
    super.key,
    required this.authCubit,
    required this.notifier,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: CustomTheme.themeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router, // Reuse the initialized router
      ),
    );
  }
}
