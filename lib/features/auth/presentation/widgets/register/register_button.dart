import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_organizer/core/go_router/route_names.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/login/external_login.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => context.push(RouteNames.registerScreen),
          child: Text(
            AppLocalizations.of(context)!.register,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        const ExternalLogin(),
      ],
    );
  }
}
