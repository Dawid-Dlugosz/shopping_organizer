import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/dialogs/auth_error_dialog.dart';
import 'package:shopping_organizer/features/auth/presentation/utils/auth_cubit_utils.dart';
import 'package:shopping_organizer/features/auth/presentation/widgets/header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              Header(title: AppLocalizations.of(context)!.register),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const RegisterContent(),
            ],
          ),
        ),
      ),
    );
  }
}
