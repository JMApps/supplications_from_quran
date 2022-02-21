import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:supplications_from_quran/data/database_query.dart';

class FavoriteState with ChangeNotifier {
  final _databaseQuery = DatabaseQuery();

  final _itemScrollController = ItemScrollController();

  ItemScrollController get getItemScrollController => _itemScrollController;

  bool _updateList = false;

  bool get getUpdateList => _updateList;

  bool _playing = false;

  bool get getPlayingState => _playing;

  int _currentTrackIndex = -1;

  int get getCurrentIndex => _currentTrackIndex;

  addRemoveFavorite(int state, int id) {
    _databaseQuery.addRemoveFavorite(state, id);
    _updateList = !_updateList;
    notifyListeners();
  }

  scrollPositionTo(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }
}
