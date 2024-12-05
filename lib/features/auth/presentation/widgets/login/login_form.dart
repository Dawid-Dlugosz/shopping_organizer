import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailTextEditingController;
  late final TextEditingController _passwordTextEditingController;
  late final GlobalKey<FormState> _formKey;

  bool _isObscureText = true;

  @override
  void initState() {
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  void _changeVisiblePassword() {
    setState(() {
      _isObscureText = !_isObscureText;
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.enterEmail;
              }
              return null;
            },
            controller: _emailTextEditingController,
            decoration: InputDecoration(
              label: Text(
                AppLocalizations.of(context)!.email,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.enterPassword;
              }
              return null;
            },
            controller: _passwordTextEditingController,
            obscureText: _isObscureText,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye,
                ),
                onPressed: _changeVisiblePassword,
              ),
              label: Text(
                AppLocalizations.of(context)!.password,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().signIn(
                        email: _emailTextEditingController.text,
                        password: _passwordTextEditingController.text,
                      );
                }
              },
              child: Text(
                AppLocalizations.of(context)!.logIn.toUpperCase(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
