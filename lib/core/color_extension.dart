import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  ColorExtension({
    required this.mainDark,
    required this.textColor,
    required this.accentColor,
    required this.errorColor,
  });

  final Color mainDark;
  final Color textColor;
  final Color accentColor;
  final Color errorColor;

  @override
  ThemeExtension<ColorExtension> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
