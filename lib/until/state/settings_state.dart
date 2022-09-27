import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supplications_from_quran/until/constants.dart';

class SettingsState with ChangeNotifier {

  final _mainSettingsBox = Hive.box(Constants.keyMainSettings);

  double _textAyahArabicSize = 16;

  double get getTextAyahArabicSize => _textAyahArabicSize;

  double _textAyahTranslationSize = 16;

  double get getTextAyahTranslationSize => _textAyahTranslationSize;

  int _textAyahArabicColor = Colors.black.value;

  int get getTextAyahArabicColor => _textAyahArabicColor;

  int _textAyahTranslationColor = Colors.black.value;

  int get getTextAyahTranslationColor => _textAyahTranslationColor;

  changeTextAyahArabicSize(double size) {
    _textAyahArabicSize = size;
    _mainSettingsBox.put(Constants.keyArabicTextSize, size);
    notifyListeners();
  }

  changeTextAyahTranslationSize(double size) {
    _textAyahTranslationSize = size;
    _mainSettingsBox.put(Constants.keyTranslationTextSize, size);
    notifyListeners();
  }

  changeTextAyahArabicColor(Color color) {
    _textAyahArabicColor = color.value;
    _mainSettingsBox.put(Constants.keyArabicTextColor, color.value);
    notifyListeners();
  }

  changeTextAyahTranslationColor(Color color) {
    _textAyahTranslationColor = color.value;
    _mainSettingsBox.put(Constants.keyTranslationTextColor, color.value);
    notifyListeners();
  }

  initSettings() {
    _textAyahArabicSize = _mainSettingsBox.get(Constants.keyArabicTextSize, defaultValue: 16.0);
    _textAyahTranslationSize = _mainSettingsBox.get(Constants.keyTranslationTextSize, defaultValue: 16.0);
    _textAyahArabicColor = _mainSettingsBox.get(Constants.keyArabicTextColor, defaultValue: Colors.black.value);
    _textAyahTranslationColor = _mainSettingsBox.get(Constants.keyTranslationTextColor, defaultValue: Colors.black.value);
  }
}