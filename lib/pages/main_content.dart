import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/data/database_query.dart';
import 'package:supplications_from_quran/provider/app_settings_state.dart';
import 'package:supplications_from_quran/provider/favorite_state.dart';
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
        title: Text(
          'Мольбы из Корана',
          style: TextStyle(
            color: const Color(0xFFe0dee2),
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF3d3d41),
        actions: [
          IconButton(
            onPressed: () {
              _audioPlayer.stop();
              Navigator.of(context, rootNavigator: true).pushNamed('/favorite');
            },
            icon: Icon(
              CupertinoIcons.bookmark_fill,
              color: context.watch<AppSettingsState>().getArabicTextColor,
            ),
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
              color: const Color(0xFFe0dee2),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: context.watch<FavoriteState>().getUpdateList
            ? _databaseQuery.getAllAyahs()
            : _databaseQuery.getAllAyahs(),
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
      bottomNavigationBar: Container(
        color: const Color(0xFF3d3d41),
        child: _audioPlayer.builderRealtimePlayingInfos(
          builder:
              (BuildContext context, RealtimePlayingInfos realtimePlayingInfo) {
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
