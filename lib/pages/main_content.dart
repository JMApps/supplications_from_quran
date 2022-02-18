import 'dart:io';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/data/database_query.dart';
import 'package:supplications_from_quran/provider/app_settings_state.dart';
import 'package:supplications_from_quran/provider/main_player_state.dart';
import 'package:supplications_from_quran/widgets/app_settings.dart';
import 'package:supplications_from_quran/widgets/lists/list_main_content.dart';
import 'package:supplications_from_quran/widgets/main_player.dart';

class MainContent extends StatefulWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  final _databaseQuery = DatabaseQuery();
  final _audioPlayer = AssetsAudioPlayer();
  var _random = Random();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  setupPlayList(AsyncSnapshot snapshot) async {
    var myList = List<Audio>.generate(snapshot.data!.length,
        (i) => Audio('assets/audios/${snapshot.data[i].nameAudio}.mp3'));

    _audioPlayer.open(
        Playlist(
          audios: myList,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }

  @override
  Widget build(BuildContext context) {
    context.read<AppSettingsState>().initPreferences();
    return Scaffold(
      appBar: AppBar(
        title: Text('Мольбы из Корана'),
        centerTitle: false,
        backgroundColor: Colors.grey[700],
        actions: [
          IconButton(
            onPressed: () {
              _audioPlayer.stop();
              Navigator.of(context, rootNavigator: true).pushNamed('/favorite');
            },
            icon: Icon(CupertinoIcons.bookmark_fill),
          ),
          IconButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return const AppSettings();
                },
              );
            },
            icon: Icon(
              CupertinoIcons.settings,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: context.watch<MainPlayerState>().getUpdateList ? _databaseQuery.getAllAyahs() : _databaseQuery.getAllAyahs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            setupPlayList(snapshot);
          }
          return snapshot.hasError
              ? Center(
                  child: Text('${snapshot.error}'),
                )
              : snapshot.hasData
                  ? ListMainContent(snapshot: snapshot, player: _audioPlayer)
                  : Center(
                      child: Platform.isIOS
                          ? const CupertinoActivityIndicator()
                          : const CircularProgressIndicator(),
                    );
        },
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(CupertinoIcons.arrow_2_squarepath),
        onPressed: () {
          int _randomNumber = _random.nextInt(55);
          context.read<MainPlayerState>().scrollPositionTo(_randomNumber);
        },
      ),
      bottomNavigationBar: Container(
        child: _audioPlayer.builderRealtimePlayingInfos(
          builder: (BuildContext context, RealtimePlayingInfos realtimePlayingInfo) {
            return MainPlayer(
              audioPlayer: _audioPlayer,
              realTimePlayingInfo: realtimePlayingInfo,
            );
          },
        ),
      ),
    );
  }
}
