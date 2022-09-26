import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xFFE8EAF6),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 3,
      backgroundColor: Color(0xff383864),
    ),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.light(
      primary: Colors.red,
    ),
    cardColor: const Color(0xFFC5CAE9),
    dividerColor: Colors.transparent,
  );

  static final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xff212126),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 3,
      backgroundColor: Color(0xff2c2c34),
    ),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.dark(
      primary: Colors.green,
    ),
    cardColor: const Color(0xff2c2c34),
    dividerColor: Colors.transparent,
  );
}

extension ColorSchemeS on ColorScheme {
  Color get mainPrimaryColor => brightness == Brightness.light
      ? const Color(0xff383864)
      : const Color(0xff2c2c34);

  Color get mainAccentColor => brightness == Brightness.light
      ? const Color(0xFFD32F2F)
      : const Color(0xFF00C853);

  Color get dotColor => brightness == Brightness.light
      ? const Color(0xFFF3E5F5)
      : const Color(0xff525260);

  Color get iconColor => brightness == Brightness.light
      ? const Color(0xff444483)
      : const Color(0xff2c2c34);

  Color get iconPrimaryColor => brightness == Brightness.light
      ? const Color(0xFFD55454)
      : const Color(0xFF00C853);
}
