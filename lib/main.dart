import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_organizer/core/custom_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_organizer/core/go_router/custom_router_config.dart';
import 'package:shopping_organizer/core/widgets/custom_multi_bloc_provider.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/firebase_options.dart';
import 'package:shopping_organizer/injectable_configure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
      child: Builder(
        builder: (context) {
          final authCubit = context.read<AuthCubit>();

          final notifier = ValueNotifier<AuthState>(authCubit.state);

          authCubit.stream.listen((state) {
            notifier.value = state;
          });

          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: CustomTheme.themeData,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: CustomRouter().routers(notifier),
          );
        },
      ),
    );
  }
}
