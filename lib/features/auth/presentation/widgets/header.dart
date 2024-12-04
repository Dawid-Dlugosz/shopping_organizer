import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }
}
