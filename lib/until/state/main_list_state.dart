import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:supplications_from_quran/data/local/database/service/database_query.dart';

class MainListState with ChangeNotifier {

  final BuildContext context;

  MainListState(this.context);

  final _player = AudioPlayer();

  final _mainListController = PageController(initialPage: 0, viewportFraction: 0.65);

  PageController get getMainListController => _mainListController;

  final _favoriteListController = PageController(initialPage: 0, viewportFraction: 0.65);

  PageController get getFavoriteListController => _favoriteListController;

  final DatabaseQuery _databaseQuery = DatabaseQuery(context);

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

  bool _trackLoopState = false;

  bool get getTrackLoopState => _trackLoopState;

  int _currentTrackIndex = 0;

  int get getCurrentTrackIndex => _currentTrackIndex;

  bool _playingState = false;

  bool get getPlayingState => _playingState;

  List<AudioSource> _myPlayList = [];

  initPlayer() async {
    _myPlayList = List<AudioSource>.generate(
      55,
      (i) {
        return AudioSource.uri(
          Uri.parse('asset:///assets/audios/ayah_${i + 1}.mp3'),
        );
      },
    );

    final myPlayList = ConcatenatingAudioSource(
      children: _myPlayList,
    );

    await _player.setAudioSource(myPlayList, initialIndex: 0, preload: false);

    _player.currentIndexStream.listen(
      (index) {
        index ??= 0;
        _currentTrackIndex = index;
        toPageAyah(index);
      },
    );

    _player.playerStateStream.listen(
      (playerState) {
        _playingState = playerState.playing;
        if (playerState.processingState == ProcessingState.completed) {
          _currentTrackIndex = 0;
          _playingState = false;
          _player.seek(Duration.zero, index: 0);
          _player.stop();
          toPageAyah(0);
        }
        notifyListeners();
      },
    );
  }

  previousTrack() {
    _player.seekToPrevious();
  }

  playPause() {
    _playingState ? _player.pause() : _player.play();
  }

  nextTrack() {
    _player.seekToNext();
  }

  trackLoopState() {
    _trackLoopState = !_trackLoopState;
    _player.setLoopMode(_trackLoopState ? LoopMode.one : LoopMode.off);
    notifyListeners();
  }

  toPageAyah(int index) {
    if (_mainListController.hasClients) {
      _mainListController.animateToPage(
        index,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInQuad,
      );
    }
  }

  toRandomAyah() {
    var randomAyah = Random();
    _mainListController.animateToPage(
      randomAyah.nextInt(55),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInQuad,
    );
    _player.seek(Duration.zero, index: randomAyah.nextInt(55));
  }

  addRemoveFavorite(int state, int itemId) async {
    await _databaseQuery.addRemoveFavoriteChapter(state, itemId);
    notifyListeners();
  }

  @override
  void dispose() {
    _mainListController.dispose();
    _player.dispose();
    super.dispose();
  }
}
