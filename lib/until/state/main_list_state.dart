import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:supplications_from_quran/data/local/database/service/database_query.dart';

class MainListState with ChangeNotifier {
  final _mainListController = PageController(viewportFraction: 0.65);

  PageController get geMainListController => _mainListController;

  final DatabaseQuery _databaseQuery = DatabaseQuery();

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

  final _player = AudioPlayer();

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
      randomAyah.nextInt(55),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInQuad,
    );
  }

  @override
  void dispose() {
    _mainListController.dispose();
    _player.dispose();
    super.dispose();
  }
}
