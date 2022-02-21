import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsState with ChangeNotifier {

  double _textArabicSize = 18;

  double _textTranslationSize = 18;

  double get getTextArabicSize => _textArabicSize;

  double get getTextTranslationSize => _textTranslationSize;

  Color _textArabicColor = Colors.red;

  Color get getArabicTextColor => _textArabicColor;

  Color _textTranslationColor = Colors.black87;

  Color get getTranslationColor => _textTranslationColor;


  updateArabicTextSizeValue(double textSize) {
    _textArabicSize = textSize;
    notifyListeners();
  }

  saveArabicTextSizeValue(double lastSizeValue) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setDouble('key_text_arabic_size_value', lastSizeValue);
  }

  updateTranslationTextSizeValue(double textSize) {
    _textTranslationSize = textSize;
    notifyListeners();
  }

  saveTranslationTextSizeValue(double lastSizeValue) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setDouble('key_text_translation_size_value', lastSizeValue);
  }

  updateTextArabicColor(Color newColor) {
    _textArabicColor = newColor;
    notifyListeners();
  }

  saveTextArabicColor(Color lastTextColor) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('key_text_arabic_color_value', lastTextColor.value);
  }

  updateTextTranslationColor(Color newColor) {
    _textTranslationColor = newColor;
    notifyListeners();
  }

  saveTextTranslationColor(Color lastTextColor) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('key_text_translation_color_value', lastTextColor.value);
  }

  initPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    _textArabicSize = preferences.getDouble('key_text_arabic_size_value') ?? 18;
    _textTranslationSize = preferences.getDouble('key_text_translation_size_value') ?? 18;
    _textArabicColor = Color(preferences.getInt('key_text_arabic_color_value') ?? Colors.red.value);
    _textTranslationColor = Color(preferences.getInt('key_text_translation_color_value') ?? Colors.black87.value);
  }
}