import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    hintColor: const Color(0xFF425166),
    primaryColor: const Color(0xFF0D3B66),
    buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF0D3B66), shape: BeveledRectangleBorder()),
    primarySwatch: Colors.green,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
    // Ajoutez d'autres propriétés de thème ici
  );
}
