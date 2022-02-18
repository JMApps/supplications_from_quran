import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/model/ayah_item.dart';
import 'package:supplications_from_quran/provider/app_settings_state.dart';
import 'package:supplications_from_quran/widgets/items/buttons_main_item_content.dart';

class ItemMainContent extends StatelessWidget {
  ItemMainContent({
    Key? key,
    required this.index,
    required this.item,
    required this.player,
  }) : super(key: key);

  final int index;
  final AyahItem item;
  final AssetsAudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return player.builderIsPlaying(
        builder: (BuildContext context, bool isPlaying) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            player.playlistPlayAtIndex(index);
          },
          borderRadius: BorderRadius.circular(15),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 750),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isPlaying && player.readingPlaylist!.currentIndex == index
                  ? Colors.yellow[50]
                  : Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${item.contentAyah}',
                    style: TextStyle(
                      fontFamily: 'Quran',
                      fontSize:
                          context.watch<AppSettingsState>().getTextArabicSize,
                      color:
                          context.watch<AppSettingsState>().getArabicTextColor,
                    ),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Html(
                  data: '${item.contentTranslation}',
                  style: {
                    "#": Style(
                        fontSize: FontSize(context
                            .watch<AppSettingsState>()
                            .getTextTranslationSize),
                        padding: const EdgeInsets.only(bottom: 8),
                        color: context
                            .watch<AppSettingsState>()
                            .getTranslationColor),
                    "small": Style(
                      fontSize: const FontSize(14),
                      color: Colors.grey,
                    )
                  },
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                  height: 1,
                  color: Colors.grey,
                ),
                ButtonsMainItemContent(
                  index: index,
                  item: item,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
