import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supplications_from_quran/data/local/database/service/database_query.dart';

class MainListState with ChangeNotifier {
  final _mainListController = PageController(viewportFraction: 0.65);

  PageController get geMainListController => _mainListController;

  final DatabaseQuery _databaseQuery = DatabaseQuery();

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

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
      randomAyah.nextInt(54),
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
