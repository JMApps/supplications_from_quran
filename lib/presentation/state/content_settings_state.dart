import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/strings/app_constraints.dart';

class ContentSettingsState extends ChangeNotifier {
  final _contentSettingsBox = Hive.box(AppConstraints.keyMainAppSettings);

  ContentSettingsState() {
    _appLocaleIndex = _contentSettingsBox.get(AppConstraints.keyAppLocaleIndex, defaultValue: _getDefLocaleIndex());
    _arabicFontIndex = _contentSettingsBox.get(AppConstraints.keyArabicFontIndex, defaultValue: 0);
    _fontIndex = _contentSettingsBox.get(AppConstraints.keyFontIndex, defaultValue: 0);
    _textArabicAlignIndex = _contentSettingsBox.get(AppConstraints.keyArabicTextAlign, defaultValue: 1);
    _textAlignIndex = _contentSettingsBox.get(AppConstraints.keyTextAlign, defaultValue: 1);
    _arabicTextSizeIndex = _contentSettingsBox.get(AppConstraints.keyArabicTextSizeIndex, defaultValue: 1);
    _textSizeIndex = _contentSettingsBox.get(AppConstraints.keyTextSizeIndex, defaultValue: 1);
    _appThemeColor = Color(_contentSettingsBox.get(AppConstraints.keyAppThemeColor, defaultValue: Colors.purple.value));
    _arabicLightTextColor = Color(_contentSettingsBox.get(AppConstraints.keyArabicLightTextColor, defaultValue: Colors.deepPurple.shade900.value));
    _arabicDarkTextColor = Color(_contentSettingsBox.get(AppConstraints.keyArabicDarkTextColor, defaultValue: Colors.deepPurple.shade50.value));
    _lightTextColor = Color(_contentSettingsBox.get(AppConstraints.keyLightTextColor, defaultValue: Colors.grey.shade900.value));
    _darkTextColor = Color(_contentSettingsBox.get(AppConstraints.keyDarkTextColor, defaultValue: Colors.grey.shade50.value));
    _themeModeIndex = _contentSettingsBox.get(AppConstraints.keyThemeIndex, defaultValue: 2);
    _wakeLock = _contentSettingsBox.get(AppConstraints.keyWakeLock, defaultValue: true);
    _wakeLock ? WakelockPlus.enable() : WakelockPlus.disable();
  }

  int _getDefLocaleIndex() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    switch (deviceLocale.languageCode) {
      case 'az':
        return 0;
      case 'en':
        return 1;
      case 'id':
        return 2;
      case 'kk':
        return 3;
      case 'ky':
        return 4;
      case 'tr':
        return 6;
      case 'uz':
        return 7;
      default:
        return 5;
    }
  }

  late int _appLocaleIndex;

  int get getAppLocaleIndex => _appLocaleIndex;

  set changeAppLocaleIndex(int index) {
    if (_appLocaleIndex != index) {
      _appLocaleIndex = index;
      _contentSettingsBox.put(AppConstraints.keyAppLocaleIndex, index);
      notifyListeners();
    }
  }

  late int _arabicFontIndex;

  int get getArabicFontIndex => _arabicFontIndex;

  set changeArabicFontIndex(int index) {
    if (_arabicFontIndex != index) {
      _arabicFontIndex = index;
      _contentSettingsBox.put(AppConstraints.keyArabicFontIndex, index);
      notifyListeners();
    }
  }

  late int _fontIndex;

  int get getFontIndex => _fontIndex;

  set changeFontIndex(int index) {
    if (_fontIndex != index) {
      _fontIndex = index;
      _contentSettingsBox.put(AppConstraints.keyFontIndex, index);
      notifyListeners();
    }
  }

  late int _textArabicAlignIndex;

  int get getTextArabicAlignIndex => _textArabicAlignIndex;

  set changeArabicTextAlignIndex(int index) {
    if (_textArabicAlignIndex != index) {
      _textArabicAlignIndex = index;
      _contentSettingsBox.put(AppConstraints.keyArabicTextAlign, index);
      notifyListeners();
    }
  }

  late int _textAlignIndex;

  int get getTextAlignIndex => _textAlignIndex;

  set changeTextAlignIndex(int index) {
    if(_textAlignIndex != index) {
      _textAlignIndex = index;
      _contentSettingsBox.put(AppConstraints.keyTextAlign, index);
      notifyListeners();
    }
  }

  late int _arabicTextSizeIndex;

  int get getArabicTextSizeIndex => _arabicTextSizeIndex;

  set changeArabicTextSizeIndex(int sizeIndex) {
    if (_arabicTextSizeIndex != sizeIndex) {
      _arabicTextSizeIndex = sizeIndex;
      _contentSettingsBox.put(AppConstraints.keyArabicTextSizeIndex, sizeIndex);
      notifyListeners();
    }
  }

  late int _textSizeIndex;

  int get getTextSizeIndex => _textSizeIndex;

  set changeTextSizeIndex(int sizeIndex) {
    if (_textSizeIndex != sizeIndex) {
      _textSizeIndex = sizeIndex;
      _contentSettingsBox.put(AppConstraints.keyTextSizeIndex, sizeIndex);
      notifyListeners();
    }
  }

  late Color _appThemeColor;

  Color get getAppThemeColor => _appThemeColor;

  set changeAppThemeColor(Color color) {
    if (_appThemeColor != color) {
      _appThemeColor = color;
      _contentSettingsBox.put(AppConstraints.keyAppThemeColor, color.value);
      notifyListeners();
    }
  }

  late Color _arabicLightTextColor;

  Color get getArabicLightTextColor => _arabicLightTextColor;

  set changeArabicLightColor(Color color) {
    if (_arabicLightTextColor != color) {
      _arabicLightTextColor = color;
      _contentSettingsBox.put(AppConstraints.keyArabicLightTextColor, color.value);
      notifyListeners();
    }
  }

  late Color _arabicDarkTextColor;

  Color get getArabicDarkTextColor => _arabicDarkTextColor;

  set changeArabicDarkColor(Color color) {
    if (_arabicDarkTextColor != color) {
      _arabicDarkTextColor = color;
      _contentSettingsBox.put(AppConstraints.keyArabicDarkTextColor, color.value);
      notifyListeners();
    }
  }

  late Color _lightTextColor;

  Color get getLightTextColor => _lightTextColor;

  set changeLightColor(Color color) {
    if (_lightTextColor != color) {
      _lightTextColor = color;
      _contentSettingsBox.put(AppConstraints.keyLightTextColor, color.value);
      notifyListeners();
    }
  }

  late Color _darkTextColor;

  Color get getDarkTextColor => _darkTextColor;

  set changeDarkColor(Color color) {
    if (_darkTextColor != color) {
      _darkTextColor = color;
      _contentSettingsBox.put(AppConstraints.keyDarkTextColor, color.value);
      notifyListeners();
    }
  }

  late int _themeModeIndex;

  int get getThemeModeIndex => _themeModeIndex;

  set changeThemeIndex(int index) {
    if (_themeModeIndex != index) {
      _themeModeIndex = index;
      _contentSettingsBox.put(AppConstraints.keyThemeIndex, index);
      notifyListeners();
    }
  }

  ThemeMode get getThemeMode {
    late ThemeMode currentThemeMode;
    switch(_themeModeIndex) {
      case 0:
        currentThemeMode = ThemeMode.light;
        break;
      case 1:
        currentThemeMode = ThemeMode.dark;
        break;
      case 2:
        currentThemeMode = ThemeMode.system;
        break;
      default: ThemeMode.system;
    }
    return currentThemeMode;
  }

  bool _wakeLock = true;

  bool get getWakeLock => _wakeLock;

  set changeWakeLock(bool onChanged) {
    if (_wakeLock != onChanged) {
      _wakeLock = onChanged;
      _wakeLock ? WakelockPlus.enable() : WakelockPlus.disable();
      _contentSettingsBox.put(AppConstraints.keyWakeLock, onChanged);
      notifyListeners();
    }
  }
}
