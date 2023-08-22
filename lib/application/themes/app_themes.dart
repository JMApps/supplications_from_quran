import 'package:flutter/material.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurple,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF512DA8),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    cardTheme: const CardTheme(
      shape: AppStyles.mainShape,
    ),
    listTileTheme: const ListTileThemeData(
      shape: AppStyles.mainShape,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: Colors.green,
    scaffoldBackgroundColor: const Color(0xFF001502),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF1B5E20),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    cardTheme: const CardTheme(
      shape: AppStyles.mainShape,
    ),
    listTileTheme: const ListTileThemeData(
      shape: AppStyles.mainShape,
    ),
  );
}
