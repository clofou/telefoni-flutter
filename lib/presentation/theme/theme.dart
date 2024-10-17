import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    hintColor: const Color(0xFF425166),
    primaryColor: const Color(0xFF4ACF16),
    buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF4ACF16), shape: BeveledRectangleBorder()),
    primarySwatch: Colors.green,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
    // Ajoutez d'autres propriétés de thème ici
  );
}
