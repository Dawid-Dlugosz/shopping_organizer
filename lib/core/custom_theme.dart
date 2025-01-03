import 'package:flutter/material.dart';
import 'package:shopping_organizer/core/color_extension.dart';

class CustomTheme {
  static final colorExtension = ColorExtension(
    mainDark: const Color.fromARGB(255, 53, 53, 53),
    textColor: const Color.fromARGB(255, 155, 148, 117),
    // accentColor: const Color.fromARGB(255, 114, 251, 173),
    accentColor: Colors.amber,

    errorColor: const Color.fromARGB(255, 255, 84, 84),
  );

  static ThemeData themeData = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: colorExtension.mainDark,
    extensions: [
      colorExtension,
    ],
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorExtension.errorColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorExtension.accentColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorExtension.errorColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorExtension.textColor,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: colorExtension.accentColor,
      ),
      contentPadding: const EdgeInsets.all(15),
      labelStyle: TextStyle(
        color: colorExtension.textColor,
        fontSize: 20,
      ),
      errorStyle: TextStyle(
        color: colorExtension.errorColor,
      ),
      fillColor: colorExtension.accentColor,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(colorExtension.accentColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.all(10),
        ),
        backgroundColor: WidgetStatePropertyAll(colorExtension.accentColor),
        foregroundColor: WidgetStatePropertyAll(colorExtension.mainDark),
        shadowColor: WidgetStatePropertyAll(colorExtension.accentColor),
        elevation: const WidgetStatePropertyAll(5.0),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: colorExtension.mainDark,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(colorExtension.accentColor),
      ),
    ),
    dialogTheme: DialogTheme(
      barrierColor: colorExtension.accentColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.all(10),
      shadowColor: colorExtension.mainDark,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      circularTrackColor: colorExtension.accentColor,
      color: colorExtension.mainDark.withAlpha(90),
    ),
    cardTheme: CardThemeData(
      shadowColor: colorExtension.accentColor.withAlpha(30),
      margin: const EdgeInsets.all(10),
      elevation: 4,
    ),
  );
}
