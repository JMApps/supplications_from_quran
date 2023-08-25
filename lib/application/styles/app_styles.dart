import 'package:flutter/material.dart';

class AppStyles {
  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);

  static const EdgeInsets mainMardingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets mainMardingMiniHorizontalMini = EdgeInsets.symmetric(horizontal: 8);

  static const EdgeInsets mainMardingVertical = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets mainMardingMiniVerticalMini = EdgeInsets.symmetric(vertical: 8);

  static const RoundedRectangleBorder mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  );

  static const BorderRadius mainBorder = BorderRadius.all(
    Radius.circular(25),
  );

  static const RoundedRectangleBorder mainAppBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.elliptical(25, 25),
    ),
  );

  static const List<TextAlign> arabicTextAlign = [
    TextAlign.right,
    TextAlign.center,
    TextAlign.left,
    TextAlign.justify,
  ];

  static const List<TextAlign> textAlign = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
    TextAlign.justify,
  ];

  static const List<String> arabicTextFont = [
    'Uthmani',
    'Hafs',
    'Scheherazade',
  ];

  static const List<String> textFont = [
    'Montserrat',
    'Gilroy',
    'Nexa',
  ];
}
