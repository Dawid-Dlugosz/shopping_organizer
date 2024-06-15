import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/dialogs/auth_error_dialog.dart';
import 'package:shopping_organizer/features/auth/presentation/utils/auth_cubit_utils.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/custom_user_listener.dart';

import 'package:shopping_organizer/features/auth/presentation/widgets/header.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/login/login_content.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/register/register_button.dart';
import 'package:shopping_organizer/features/custom_user/domain/entities/custom_user.dart';
import 'package:shopping_organizer/features/custom_user/presentation/cubit/custom_user_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomUserListener(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.mapOrNull(
            authorized: (_) {
              // go to home page
            },
            created: (userCredential) async {
              final customUserCubit = context.read<CustomUserCubit>();
              final fcmToken =
                  await context.read<FirebaseMessaging>().getToken();
              final customUser = CustomUser(
                fcmToken: fcmToken!,
                userId: userCredential.user.uid,
                shoppingLists: [],
              );
              customUserCubit.createCustomUser(
                customUser: customUser,
              );
              // go to home page
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
                builder: (_) => AuthErrorDialog(
                  message: message,
                ),
              );
            },
          );
        },
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      'Shopping Organizer',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Header(title: AppLocalizations.of(context)!.logIn),
                    const SizedBox(height: 20),
                    const LoginContent(),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    const RegisterButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
