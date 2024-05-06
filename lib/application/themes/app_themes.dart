import 'package:flutter/material.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    colorSchemeSeed: Colors.deepPurple,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 18,
      )
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.mainAppBarShape,
    ),
    cardTheme: const CardTheme(
      shape: AppStyles.mainShape,
    ),
    listTileTheme: const ListTileThemeData(
      shape: AppStyles.mainShape,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: AppStyles.mainShape,
      backgroundColor: Colors.transparent,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
    colorSchemeSeed: Colors.deepPurple,
    textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 18,
        )
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      shape: AppStyles.mainShape,
    ),
    listTileTheme: const ListTileThemeData(
      shape: AppStyles.mainShape,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: AppStyles.mainShape,
      backgroundColor: Colors.transparent,
    ),
  );
}