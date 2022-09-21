import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xFFFFF6F6),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xff212126),
    ),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.light(
      primary: Colors.red,
    ),
    cardColor: const Color(0xFFFFFFFF),
    dividerColor: Colors.transparent,
  );

  static final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xff2c2c34),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xff212126),
    ),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.light(
      primary: Colors.red,
    ),
    cardColor: const Color(0xff212126),
    dividerColor: Colors.transparent,
  );
}

extension ColorSchemeS on ColorScheme {
  Color get mainPrimaryColor => brightness == Brightness.light
      ? const Color(0xff212126)
      : const Color(0xff212126);
}
