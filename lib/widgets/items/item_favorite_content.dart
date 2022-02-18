import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:supplications_from_quran/model/ayah_item.dart';
import 'package:supplications_from_quran/provider/app_settings_state.dart';
import 'package:supplications_from_quran/widgets/items/buttons_main_item_content.dart';
import 'package:provider/provider.dart';

class ItemFavoriteContent extends StatelessWidget {
  const ItemFavoriteContent({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final AyahItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              '${item.contentAyah}',
              style: TextStyle(
                fontFamily: 'Quran',
                fontSize: context.watch<AppSettingsState>().getTextArabicSize,
                color: context.watch<AppSettingsState>().getArabicTextColor,
              ),
              textAlign: TextAlign.start,
              textDirection: TextDirection.rtl,
            ),
          ),
          Html(
            data: '${item.contentTranslation}',
            style: {
              "#": Style(
                padding: const EdgeInsets.only(bottom: 8),
                fontSize: FontSize(context.watch<AppSettingsState>().getTextTranslationSize),
                color: context.watch<AppSettingsState>().getTranslationColor,
              ),
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
    );
  }
}
