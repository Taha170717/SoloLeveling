import 'package:flutter/material.dart';

class AppTheme {
  // Colors based on Solo Leveling's purple/blue aesthetic
  static const Color primaryColor = Color(0xFF6A1B9A);
  static const Color accentColor = Color(0xFF3949AB);
  static const Color shadowPurple = Color(0xFF9C27B0);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color textColor = Color(0xFFE0E0E0);

  // Light Theme (though Solo Leveling is better represented by dark theme)
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.black87,
      ),
    ),
  );

  // Dark Theme - Perfect for Solo Leveling's aesthetic
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      background: darkBackground,
      surface: darkSurface,
    ),
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      color: darkSurface,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: textColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkBackground,
      selectedItemColor: shadowPurple,
      unselectedItemColor: Colors.grey,
    ),
  );
}
