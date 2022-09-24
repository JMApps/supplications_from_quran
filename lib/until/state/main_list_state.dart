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

  bool _trackLoopState = false;

  bool get getTrackLoopState => _trackLoopState;

  int _currentTrackIndex = 0;

  int get getCurrentTrackIndex => _currentTrackIndex;

  bool _playingState = false;

  bool get getPlayingState => _playingState;

  List<AudioSource> _myPlayList = [];

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

  initPlayer() async {
    _myPlayList = List<AudioSource>.generate(55, (i) => AudioSource.uri(Uri.parse('asset:///assets/audios/ayah_$i.mp3')));
    final myPlayList = ConcatenatingAudioSource(
      children: _myPlayList,
    );

    await _player.setAudioSource(myPlayList,
        initialIndex: _currentTrackIndex, preload: false);

    _player.currentIndexStream.listen(
          (index) {
        _currentTrackIndex = index!;
        notifyListeners();
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
        }
        notifyListeners();
      },
    );
  }

  previousTrack() {
    _player.seekToPrevious();
    toPageAyah(_currentTrackIndex);
  }

  playPause() {
    _playingState ? _player.pause() : _player.play();
  }

  nextTrack() {
    _player.seekToNext();
    toPageAyah(_currentTrackIndex);
  }

  trackLoopState() {
    _trackLoopState = !_trackLoopState;
    _player.setLoopMode(_trackLoopState ? LoopMode.one : LoopMode.off);
    notifyListeners();
  }


  @override
  void dispose() {
    _mainListController.dispose();
    _player.dispose();
    super.dispose();
  }
}
