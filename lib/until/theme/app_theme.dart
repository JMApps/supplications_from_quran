import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xFFF3E5F5),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xff383864),
    ),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.light(
      primary: Colors.redAccent,
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
    colorScheme: const ColorScheme.dark(
      primary: Colors.greenAccent,
    ),
    cardColor: const Color(0xff212126),
    dividerColor: Colors.transparent,
  );
}

extension ColorSchemeS on ColorScheme {
  Color get mainPrimaryColor => brightness == Brightness.light
      ? const Color(0xff383864)
      : const Color(0xff212126);

  Color get mainAccentColor => brightness == Brightness.light
      ? const Color(0xFFD50000)
      : const Color(0xFF00C853);

  Color get dotColor => brightness == Brightness.light
      ? const Color(0xFFF3E5F5)
      : const Color(0xff525260);
}
