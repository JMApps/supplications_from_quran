import 'package:flutter/material.dart';

class SettingsState with ChangeNotifier {

  double _textAyahArabicSize = 16;

  double get getTextAyahArabicSize => _textAyahArabicSize;

  double _textAyahTranslationSize = 16;

  double get getTextAyahTranslationSize => _textAyahTranslationSize;

  Color _textAyahArabicColor = Colors.black;

  Color get getTextAyahArabicColor => _textAyahArabicColor;

  Color _textAyahTranslationColor = Colors.black;

  Color get getTextAyahTranslationColor => _textAyahTranslationColor;

  changeTextAyahArabicSize(double size) {
    _textAyahArabicSize = size;
    notifyListeners();
  }

  changeTextAyahTranslationSize(double size) {
    _textAyahTranslationSize = size;
    notifyListeners();
  }

  changeTextAyahArabicColor(Color color) {
    _textAyahArabicColor = color;
    notifyListeners();
  }

  changeTextAyahTranslationColor(Color color) {
    _textAyahTranslationColor = color;
    notifyListeners();
  }
}