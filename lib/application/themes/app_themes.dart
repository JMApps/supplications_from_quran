import 'package:flutter/material.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: 'Montserrat',
    colorSchemeSeed: Colors.deepPurple,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 18,
      )
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF512DA8),
      elevation: 0,
      shape: AppStyles.mainAppBarShape,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Montserrat',
      ),
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
    useMaterial3: true,
    fontFamily: 'Montserrat',
    colorSchemeSeed: Colors.green,
    textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 18,
        )
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF1B5E20),
      elevation: 0,
      shape: AppStyles.mainAppBarShape,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Montserrat',
      ),
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

extension CustomColors on ColorScheme {
  Color get titleColor => brightness == Brightness.light
      ? const Color(0xFF512DA8)
      : const Color(0xFF1B5E20);

  Color get mainDefault => brightness == Brightness.light
      ? const Color(0xB2000000)
      : const Color(0xFFBDBDBD);
}
