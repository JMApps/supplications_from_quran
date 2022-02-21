import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:supplications_from_quran/provider/favorite_state.dart';
import 'package:supplications_from_quran/widgets/items/item_main_content.dart';

class ListMainContent extends StatelessWidget {
  ListMainContent({
    Key? key,
    required this.snapshot,
    required this.player,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final AssetsAudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: ScrollablePositionedList.builder(
        padding: EdgeInsets.zero,
        itemScrollController: context.watch<FavoriteState>().getItemScrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemMainContent(
            index: index,
            item: snapshot.data![index],
            player: player,
          );
        },
      ),
    );
  }
}
