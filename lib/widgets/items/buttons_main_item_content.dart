import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:supplications_from_quran/model/ayah_item.dart';
import 'package:supplications_from_quran/provider/app_settings_state.dart';
import 'package:supplications_from_quran/provider/favorite_state.dart';

class ButtonsMainItemContent extends StatelessWidget {
  const ButtonsMainItemContent({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final AyahItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Дуа – ${item.id}',
          style: TextStyle(
            fontSize: 18,
            color: context.watch<AppSettingsState>().getArabicTextColor,
          ),
        ),
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
            Share.share(
                '${item.contentAyah}\n\n' '${item.contentTranslationShare}');
          },
          icon: const Icon(CupertinoIcons.arrowshape_turn_up_right),
          color: Colors.grey[800],
        ),
        IconButton(
          onPressed: () {
            context
                .read<FavoriteState>()
                .addRemoveFavorite(item.favoriteState == 0 ? 1 : 0, item.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: item.favoriteState == 0
                    ? Text(
                        'Добавлено',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        'Удалено',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                duration: Duration(milliseconds: 500),
                backgroundColor: Colors.blue,
              ),
            );
          },
          icon: Icon(
            item.favoriteState == 0
                ? CupertinoIcons.bookmark
                : CupertinoIcons.bookmark_fill,
            color: context.watch<AppSettingsState>().getArabicTextColor,
          ),
          color: Colors.grey[800],
        )
      ],
    );
  }
}
