import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            label: Text(
              AppLocalizations.of(context)!.email,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
            label: Text(
              AppLocalizations.of(context)!.nickname,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            label: Text(
              AppLocalizations.of(context)!.password,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
