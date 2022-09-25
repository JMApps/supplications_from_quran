import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/until/state/main_list_state.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class MainBottomPlayerBar extends StatelessWidget {
  const MainBottomPlayerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readPlayer = context.read<MainListState>();
    final myColor = Theme.of(context).colorScheme;
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(55, 35),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Material(
        color: Theme.of(context).colorScheme.mainPrimaryColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.elliptical(55, 35),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: const Icon(CupertinoIcons.backward_end, color: Colors.white),
              onPressed: () {
                readPlayer.previousTrack();
              },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: Icon(context.watch<MainListState>().getPlayingState ? CupertinoIcons.pause : CupertinoIcons.play, color: Colors.white),
              onPressed: () {
                readPlayer.playPause();
              },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: const Icon(CupertinoIcons.forward_end, color: Colors.white),
              onPressed: () {
                readPlayer.nextTrack();
              },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: Icon(CupertinoIcons.arrow_2_circlepath, color: readPlayer.getTrackLoopState ? myColor.mainAccentColor : Colors.white),
              onPressed: () {
                readPlayer.trackLoopState();
              },
            ),
          ],
        ),
      ),
    );
  }
}
