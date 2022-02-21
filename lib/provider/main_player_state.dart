import 'package:flutter/material.dart';

class MainPlayerState with ChangeNotifier {
  bool _loopState = false;

  bool get getLoopState => _loopState;

  changeLoopState() {
    _loopState = !_loopState;
    notifyListeners();
  }
}
