import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_organizer/core/color_extension.dart';
import 'package:shopping_organizer/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopping_organizer/features/auth/presentation/dialogs/title_dialog.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _nicknameController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  bool _isObscureText = true;

  void _changeVisiblePassword() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _nicknameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nicknameController.dispose();
    _passwordController.dispose();

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
            controller: _emailController,
            decoration: InputDecoration(
              label: Text(
                AppLocalizations.of(context)!.email,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.enterNickname;
              }
              return null;
            },
            controller: _nicknameController,
            decoration: InputDecoration(
              label: Text(
                AppLocalizations.of(context)!.nickname,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.enterPassword;
              }
              return null;
            },
            controller: _passwordController,
            obscureText: _isObscureText,
            decoration: InputDecoration(
              label: Text(
                AppLocalizations.of(context)!.password,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscureText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye,
                ),
                onPressed: _changeVisiblePassword,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().createAccount(
                        email: _emailController.text,
                        password: _passwordController.text,
                        nickname: _nicknameController.text,
                      );
                }
              },
              child: Text(
                AppLocalizations.of(context)!.createAccount,
              ),
            ),
          )
        ],
      ),
    );
  }
}
