import 'package:flutter/material.dart';

import '../strings/app_constraints.dart';

class AppThemes {
  final Color _appColor;

  AppThemes(this._appColor);

  ThemeData get lightTheme => _buildTheme(Brightness.light);

  ThemeData get darkTheme => _buildTheme(Brightness.dark);

  ThemeData _buildTheme(Brightness brightness) {
    return ThemeData(
      fontFamily: AppConstraints.fontRaleway,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: _appColor,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        showDragHandle: true,
        dragHandleSize: Size(48, 3),
      ),
    );
  }
}