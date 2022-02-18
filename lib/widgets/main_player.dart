import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/provider/main_player_state.dart';

class MainPlayer extends StatelessWidget {
  const MainPlayer({
    Key? key,
    required this.audioPlayer,
    required this.realTimePlayingInfo,
  }) : super(key: key);

  final AssetsAudioPlayer audioPlayer;
  final RealtimePlayingInfos realTimePlayingInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            child: Text(
              '${getTimeString(realTimePlayingInfo.currentPosition.inSeconds)}',
              style: TextStyle(
                color: const Color(0xFFe0dee2),
                fontSize: 16,
                fontFamily: 'Gilroy',
              ),
            ),
          ),
          IconButton(
            icon: Icon(CupertinoIcons.backward_end_alt),
            splashColor: const Color(0xFFe0dee2),
            color: const Color(0xFFe0dee2),
            iconSize: 30,
            onPressed: () {
              if (audioPlayer.readingPlaylist!.currentIndex > 0) {
                audioPlayer.previous();
                context.read<MainPlayerState>().scrollPositionTo(audioPlayer.readingPlaylist!.currentIndex);
              }
            },
          ),
          IconButton(
            icon: Icon(realTimePlayingInfo.isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill),
            color: const Color(0xFFe0dee2),
            iconSize: 45,
            onPressed: () {
              audioPlayer.playOrPause();
              context.read<MainPlayerState>().scrollPositionTo(audioPlayer.readingPlaylist!.currentIndex);
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.forward_end_alt),
            splashColor: const Color(0xff985ac4),
            color: const Color(0xFFe0dee2),
            iconSize: 30,
            onPressed: () {
              audioPlayer.next(stopIfLast: true);
              context.read<MainPlayerState>().scrollPositionTo(audioPlayer.readingPlaylist!.currentIndex);
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.repeat),
            color: context.watch<MainPlayerState>().getLoopState ? const Color(0xff985ac4) : const Color(0xFFe0dee2),
            iconSize: 30,
            onPressed: () {context.read<MainPlayerState>().changeLoopState(!context.watch<MainPlayerState>().getLoopState);
              audioPlayer.setLoopMode(context.watch<MainPlayerState>().getLoopState ? LoopMode.single : LoopMode.none);
            },
          ),
          Container(
            width: 50,
            child: Text(
              '${getTimeString(realTimePlayingInfo.duration.inSeconds)}',
              style: TextStyle(
                color: const Color(0xFFe0dee2),
                fontSize: 16,
                fontFamily: 'Gilroy',
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getTimeString(int seconds) {
    String minuteString = '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }
}
