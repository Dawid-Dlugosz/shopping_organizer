import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_organizer/core/color_extension.dart';

import 'package:shopping_organizer/core/go_router/route_names.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/dialogs/title_dialog.dart';
import 'package:shopping_organizer/features/auth/presentation/utils/auth_cubit_utils.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/custom_user_listener.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/header_text.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/login/external_login.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomUserListener(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.mapOrNull(
            authorized: (_) {
              context.go(RouteNames.shoppingList);
            },
            error: (value) {
              String message = value.code == null
                  ? AppLocalizations.of(context)!.unexpectedError
                  : AuthCubitUtils.getErrorText(
                      value.code!,
                      context,
                    );

              showDialog(
                context: context,
                builder: (_) => TitleDialog(
                  title: AppLocalizations.of(context)!.errorOcured,
                  message: message,
                ),
              );
            },
          );
        },
        child: Scaffold(
          body: Center(
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
        ),
      ),
    );
  }
}
