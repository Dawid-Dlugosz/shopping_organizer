import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:shopping_organizer/features/auth/presentation/widgets/register/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.createAccount),
      ),
      body: const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
