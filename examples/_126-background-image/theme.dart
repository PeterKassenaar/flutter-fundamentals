// theme.dart
import 'package:flutter/material.dart';

// Create a theme in a separate file, return it
// as a function that returns a ThemeData() instance.
// NOTE: This file DOES NOT have
// a user interface. It just returns a theme.
ThemeData buildThemeData() {
  return ThemeData(
    // 1. Define the main color scheme
    primaryColor: Colors.green[800],
    hintColor: Colors.green[800],

    // 2. Set the default font family
    fontFamily: 'BungeeOutline',

    // 3. Customize AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[800],
      centerTitle: true, // Center the title
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // 4. Customize FloatingActionButton theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green[800],
      foregroundColor: Colors.white, // Text/Icon color
    ),

    // 5. Define default text styles
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.green[800],
      ),
    ),

    // 6. Define more default Theme Styles, as needed.
  );
}
