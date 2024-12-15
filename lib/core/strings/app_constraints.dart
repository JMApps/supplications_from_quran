import 'dart:ui';

class AppConstraints {
  static const keyMainAppSettings = 'key_main_app_settings';
  static const keyFavoriteSupplications = 'key_favorite_supplications';
  static const keyFavoriteSupplicationIds = 'key_favorite_supplication_ids';

  // Settings
  static const String keyAppLocaleIndex = 'key_app_locale_index';

  static const String keyArabicFontIndex = 'key_sfq_arabic_font_index';
  static const String keyFontIndex = 'key_sfq_font_index';

  static const String keyArabicTextAlign = 'key_sfq_arabic_text_align';
  static const String keyTextAlign = 'key_sfq_text_align';

  static const String keyArabicTextSizeIndex = 'key_sfq_arabic_text_size';
  static const String keyTextSizeIndex = 'key_sfq_text_size';

  static const String keyAppThemeColor = 'key_sfq_app_theme_color';

  static const String keyArabicLightTextColor = 'key_sfq_arabic_light_text_color';
  static const String keyArabicDarkTextColor = 'key_sfq_arabic_dark_text_color';

  static const String keyLightTextColor = 'key_sfq_light_text_color';
  static const String keyDarkTextColor = 'key_sfq_dark_text_color';

  static const String keyThemeIndex = 'key_sfq_theme_index';
  static const String keyWakeLock = 'key_sfq_wake_lock';

  static const String fontRaleway = 'Raleway';
  static const String fontGilroy = 'Gilroy';
  static const String fontHafs = 'Hafs';

  static const List<Locale> appLocales = [
    Locale('az', 'AZ'),
    Locale('en', 'US'),
    Locale('id', 'ID'),
    Locale('kk', 'KZ'),
    Locale('ky', 'KG'),
    Locale('ru', 'RU'),
    Locale('tr', 'TR'),
    Locale('uz', 'UZ'),
  ];

  static const List<String> appLocaleNames = [
    'Azərbaycan dili',
    'English',
    'Bahasa Indonesia',
    'Қазақ тілі',
    'Кыргыз тили',
    'Русский',
    'Türkçe',
    'Oʻzbekcha',
  ];
}
