import 'dart:math';

import 'package:flutter/material.dart';

class MainListState with ChangeNotifier {
  final _mainListController = PageController(viewportFraction: 0.65);

  PageController get geMainListController => _mainListController;

  toPageAyah(int index) {
    _mainListController.animateToPage(
      index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInQuad,
    );
  }

  toRandomAyah() {
    var randomAyah = Random();
    _mainListController.animateToPage(
      randomAyah.nextInt(50),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInQuad,
    );
  }

  @override
  void dispose() {
    _mainListController.dispose();
    super.dispose();
  }
}
