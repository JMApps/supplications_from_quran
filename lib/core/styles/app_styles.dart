import 'package:flutter/material.dart';

class AppStyles {
  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);

  static const EdgeInsets mainMardingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets mardingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);

  static const EdgeInsets mainMardingVertical = EdgeInsets.symmetric(vertical: 16);

  static const EdgeInsets mardingMiniWithoutTop = EdgeInsets.only(left: 8, bottom: 16, right: 8);
  static const EdgeInsets mardingMiniWithoutBottom = EdgeInsets.only(left: 8, top: 8, right: 8);

  static const EdgeInsets mardingBottomMini = EdgeInsets.only(bottom: 8);
  static const EdgeInsets mardingRightMini = EdgeInsets.only(right: 8);

  static const RoundedRectangleBorder mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  static const BorderRadius mainBorder = BorderRadius.all(
    Radius.circular(20),
  );

  static const BorderRadius borderWithoutBottom = BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  );

  static const BorderRadius borderWithoutTop = BorderRadius.only(
    bottomRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
  );

  static const List<TextAlign> textAligns = [
    TextAlign.start,
    TextAlign.center,
    TextAlign.end,
    TextAlign.justify,
  ];

  static const List<IconData> arabicTextAlignIcons = [
    Icons.format_align_right_rounded,
    Icons.format_align_center_rounded,
    Icons.format_align_left_rounded,
    Icons.format_align_justify_rounded,
  ];

  static const List<IconData> textAlignIcons = [
    Icons.format_align_left_rounded,
    Icons.format_align_center_rounded,
    Icons.format_align_right_rounded,
    Icons.format_align_justify_rounded,
  ];

  static const List<double> textSizes = [
    18.0,
    20.0,
    22.0,
    28.0,
    35.0,
    60.0
  ];

  static const List<String> arabicTextFont = [
    'Hafs',
    'Uthmani',
    'Scheherazade',
  ];

  static const List<String> textFont = [
    'Raleway',
    'Gilroy',
    'Montserrat',
  ];
}
