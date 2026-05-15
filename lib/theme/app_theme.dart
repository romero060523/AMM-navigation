import 'package:flutter/material.dart';

class AppTheme {
  // Colores principales
  static const Color primary    = Color(0xFF1A3A6B);
  static const Color success    = Color(0xFF2E7D32);
  static const Color teal       = Color(0xFF00695C);
  static const Color purple     = Color(0xFF6A1B9A);
  static const Color danger     = Color(0xFFC62828);
  static const Color background = Color(0xFFF4F6FA);

  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        useMaterial3: true,
        fontFamily: 'Georgia',
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: primary, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      );
}