import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supplications_from_quran/domain/interactors/supplication_interactor.dart';

class MainAppState extends ChangeNotifier {
  final ItemScrollController _scrollController = ItemScrollController();

  ItemScrollController get getScrollController => _scrollController;

  final PageController _pageController = PageController();

  PageController get getPageController => _pageController;

  final SupplicationInteractor _interactor = SupplicationInteractor();

  SupplicationInteractor get getSupplicationInteractor => _interactor;

  Future<void> addRemoveFavorite({required String tableName, required int supplicationId}) async {
    await _interactor.addRemoveFavorite(tableName: tableName, supplicationId: supplicationId);
    notifyListeners();
  }

  setDefaultListItem() {
    final Random random = Random();
    _scrollController.scrollTo(
      index: random.nextInt(54),
      duration: const Duration(milliseconds: 500),
    );
  }

  setDefaultPageItem() {
    final Random random = Random();
    _pageController.animateToPage(
      random.nextInt(54),
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  int _currentIndex = 0;

  int get getCurrentIndex => _currentIndex;

  set setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }


  set shareContent(String content) {
    Share.share(content, sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2));
  }

  set copyContent(String content) {
    FlutterClipboard.copy(content);
  }
}
