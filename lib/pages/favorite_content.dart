import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/data/database_query.dart';
import 'package:supplications_from_quran/provider/main_player_state.dart';
import 'package:supplications_from_quran/widgets/lists/list_favorite_content.dart';

class FavoriteContent extends StatefulWidget {
  const FavoriteContent({Key? key}) : super(key: key);

  @override
  _FavoriteContentState createState() => _FavoriteContentState();
}

class _FavoriteContentState extends State<FavoriteContent> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Избранное',
          style: TextStyle(
            color: const Color(0xFFe0dee2),
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF3d3d41),
      ),
      body: FutureBuilder<List>(
        future: context.watch<MainPlayerState>().getUpdateList
            ? _databaseQuery.getFavoriteAyahs()
            : _databaseQuery.getFavoriteAyahs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            setupPlayList(snapshot);
          }
          return snapshot.hasError
              ? Center(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      CupertinoIcons.bookmark,
                      size: 25,
                    ),
                    label: Text(
                      'Избранных дуа нет',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              : snapshot.hasData
                  ? ListFavoriteContent(snapshot: snapshot)
                  : Center(
                      child: Platform.isIOS
                          ? const CupertinoActivityIndicator()
                          : const CircularProgressIndicator(),
                    );
        },
      ),
    );
  }
}
