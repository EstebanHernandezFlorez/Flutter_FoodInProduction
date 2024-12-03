// lib/core/theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      hintColor: Colors.blueAccent,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        displayLarge: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 14, color: Colors.grey[800]),
        bodyMedium: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      appBarTheme:  const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(surface: Colors.white),
    );
  }

  // Puedes agregar más temas como darkTheme si lo necesitas
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      hintColor: Colors.blueAccent,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 14, color: Colors.white70),
        bodyMedium: TextStyle(fontSize: 12, color: Colors.white54),
      ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(surface: Colors.black),
    );
  }
}