import 'package:flutter/material.dart';
import 'package:shopping_organizer/core/colors.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: background,
  primaryColor: text,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: iconBackground,
    foregroundColor: background,
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: text,
    backgroundColor: background,
  ),
);
