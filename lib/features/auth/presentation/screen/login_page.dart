import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_organizer/core/color_extension.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/core/widgets/loading_widget.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/auth_listener_widget.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/header_text.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/login/external_login.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state.maybeMap(
              loading: (_) => const LoadingWidget(),
              orElse: () => Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        'Shopping Organizer',
                        style: TextStyle(
                          color: Theme.of(context)
                              .extension<ColorExtension>()!
                              .accentColor,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 20),
                      HeaderText(
                        title: AppLocalizations.of(context)!.logIn,
                      ),
                      const SizedBox(height: 20),
                      const LoginForm(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.notAccount,
                          ),
                          TextButton(
                            onPressed: () =>
                                context.push(RouteNames.registerScreen),
                            child: Text(
                              AppLocalizations.of(context)!.createAccount,
                            ),
                          )
                        ],
                      ),
                      const ExternalLogin(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
