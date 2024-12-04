import 'package:flutter/material.dart';

class ExternalLogin extends StatelessWidget {
  const ExternalLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Google'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text('facebook'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Apple'),
        ),
      ],
    );
  }
}
