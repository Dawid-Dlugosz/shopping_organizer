import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:shopping_organizer/features/auth/presentation/widgets/header_text.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/login/login_form.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/register/register_content.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
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
              HeaderText(title: AppLocalizations.of(context)!.createAccount),
              const RegisterContent(),
            ],
          ),
        ),
      ),
    );
  }
}
