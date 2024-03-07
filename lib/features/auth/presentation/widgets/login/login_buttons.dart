import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';

class LoginButtons extends StatefulWidget {
  const LoginButtons({super.key});

  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  bool _isPasswordVisible = false;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();

    super.initState();
  }

  void _changeVisiblePassword() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailTextEditingController,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          decoration: InputDecoration(
            label: Text(
              AppLocalizations.of(context)!.email,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _passwordTextEditingController,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          obscureText: _isPasswordVisible,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            suffix: IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye,
              ),
              onPressed: _changeVisiblePassword,
            ),
            label: Text(
              AppLocalizations.of(context)!.password,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.read<AuthCubit>().signIn(
                  email: _emailTextEditingController.text,
                  password: _passwordTextEditingController.text,
                );
          },
          child: Text(
            AppLocalizations.of(context)!.logIn.toUpperCase(),
          ),
        )
      ],
    );
  }
}
