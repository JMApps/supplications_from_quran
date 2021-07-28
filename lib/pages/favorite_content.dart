import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share/share.dart';
import 'package:supplications_from_quran/data/database_query.dart';
import 'package:supplications_from_quran/model/ayah_item.dart';

class FavoriteContent extends StatefulWidget {
  const FavoriteContent({Key? key}) : super(key: key);

  @override
  _FavoriteContentState createState() => _FavoriteContentState();
}

class _FavoriteContentState extends State<FavoriteContent> {
  var _databaseQuery = DatabaseQuery();
  final _itemScrollController = ItemScrollController();
  var _random = Random();

  late AssetsAudioPlayer audioPlayer;
  bool _loopTrack = false;

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  initPlayer() async {
    audioPlayer = AssetsAudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getFavoriteAyahs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Scaffold(
                appBar: AppBar(
                  title: Text('Избранное'),
                  centerTitle: true,
                  backgroundColor: Colors.grey[700],
                  actions: [
                    snapshot.data!.length >= 10
                        ? IconButton(
                            onPressed: () {
                              int randomNumber = _random.nextInt(55);
                              _scrollPositionTo(randomNumber);
                            },
                            icon: Icon(CupertinoIcons.arrow_2_squarepath),
                          )
                        : SizedBox(),
                  ],
                ),
                body: Column(
                  children: [
                    snapshot.hasData
                        ? Expanded(
                            child: Scrollbar(child: _buildList(snapshot)))
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    Divider(
                      height: 2,
                      color: Colors.grey[800],
                    ),
                    snapshot.data!.length != 0
                        ? _buildPlayer(snapshot)
                        : SizedBox(),
                  ],
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text('Избранное'),
                  centerTitle: true,
                  backgroundColor: Colors.grey[700],
                ),
                body: Center(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: Icon(CupertinoIcons.bookmark_fill),
                      label: Text(
                        'Избранных дуа нет',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              );
      },
    );
  }

  // Ayah List
  Widget _buildList(AsyncSnapshot snapshot) {
    return ScrollablePositionedList.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemScrollController: _itemScrollController,
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(snapshot.data![index], index);
      },
    );
  }

  // Ayah item
  Widget _buildItem(AyahItem item, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(8),
      child: _buildContent(item, index),
    );
  }

  // Text content
  Widget _buildContent(AyahItem item, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            '${item.contentAyah}',
            style: TextStyle(fontFamily: 'Quran', fontSize: 20),
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
          ),
        ),
        Html(
          data: '${item.contentTranslation}',
          style: {
            "#": Style(
                fontSize: FontSize(18), padding: EdgeInsets.only(bottom: 8)),
            "small": Style(fontSize: FontSize(14), color: Colors.grey[500])
          },
        ),
        Divider(
          indent: 16,
          endIndent: 16,
          height: 1,
          color: Colors.grey[800],
        ),
        _buildButtons(item, index),
      ],
    );
  }

  // Buttons
  Widget _buildButtons(AyahItem item, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.grey[300]),
          child: Text(
            '${item.id}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
        audioPlayer.builderRealtimePlayingInfos(
            builder: (context, realtimePLayingInfo) {
          return item.nameAudio != null
              ? IconButton(
                  onPressed: () {
                    if (!realtimePLayingInfo.isPlaying) {
                      audioPlayer.playlistPlayAtIndex(index);
                    } else {
                      audioPlayer.playOrPause();
                    }
                  },
                  icon: Icon(
                    realtimePLayingInfo.isPlaying && valuesIndex(index)
                        ? CupertinoIcons.stop_fill
                        : CupertinoIcons.play_fill,
                    color: Colors.grey[700],
                  ),
                )
              : SizedBox();
        }),
        IconButton(
          onPressed: () {
            FlutterClipboard.copy(
                    '${item.contentAyah}\n\n ${item.contentTranslationShare}')
                .then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Скопировано'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            });
          },
          icon: Icon(CupertinoIcons.doc_on_doc),
          color: Colors.grey[800],
        ),
        IconButton(
          onPressed: () {
            Share.share('${item.contentAyah}\n\n'
                '${item.contentTranslationShare}');
          },
          icon: Icon(CupertinoIcons.arrowshape_turn_up_right),
          color: Colors.grey[800],
        ),
      ],
    );
  }

  _scrollPositionTo(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
    audioPlayer.playlistPlayAtIndex(index);
  }

  setupPlayList(AsyncSnapshot snapshot) async {
    var myList = List<Audio>.generate(snapshot.data!.length,
        (i) => Audio('assets/audios/${snapshot.data[i].nameAudio}.mp3'));

    audioPlayer.open(
        Playlist(
          audios: myList,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }

  Widget _buildPlayer(AsyncSnapshot snapshot) {
    setupPlayList(snapshot);
    return audioPlayer.builderRealtimePlayingInfos(
      builder: (context, realtimePLayingInfo) {
        audioPlayer.playlistAudioFinished.listen((event) {
          if (audioPlayer.readingPlaylist!.currentIndex <
              snapshot.data!.length) {
            if (snapshot.data!.length > 2) {
              _scrollPositionTo(audioPlayer.readingPlaylist!.currentIndex);
            }
          }
        });
        return Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                child: Text(
                  '${getTimeString(realtimePLayingInfo.currentPosition.inSeconds)}',
                  style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: 16,
                      fontFamily: 'Gilroy'),
                ),
              ),
              IconButton(
                icon: Icon(CupertinoIcons.backward_end_alt),
                splashColor: Colors.blue,
                color: Colors.blue[500],
                iconSize: 30,
                onPressed: () {
                  if (audioPlayer.readingPlaylist!.currentIndex > 0) {
                    audioPlayer.previous();
                    _scrollPositionTo(
                        audioPlayer.readingPlaylist!.currentIndex);
                  }
                },
              ),
              IconButton(
                icon: Icon(realtimePLayingInfo.isPlaying
                    ? CupertinoIcons.pause_fill
                    : CupertinoIcons.play_fill),
                color: Colors.blueGrey[800],
                iconSize: 45,
                onPressed: () {
                  audioPlayer.playOrPause();
                },
              ),
              IconButton(
                icon: Icon(CupertinoIcons.forward_end_alt),
                splashColor: Colors.blue,
                color: Colors.blue[500],
                iconSize: 30,
                onPressed: () {
                  audioPlayer.next(stopIfLast: true);
                },
              ),
              IconButton(
                icon: Icon(CupertinoIcons.repeat),
                color: _loopTrack ? Colors.blue[500] : Colors.grey[800],
                iconSize: 30,
                onPressed: () {
                  _loopTrack = !_loopTrack;
                  audioPlayer.setLoopMode(
                      _loopTrack ? LoopMode.single : LoopMode.none);
                },
              ),
              Container(
                width: 50,
                child: Text(
                  '${getTimeString(realtimePLayingInfo.duration.inSeconds)}',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontFamily: 'Gilroy'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }

  bool valuesIndex(index) {
    if (audioPlayer.readingPlaylist!.currentIndex == index) {
      return true;
    } else {
      return false;
    }
  }
}
