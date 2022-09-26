import 'package:flutter/material.dart';
import 'package:supplications_from_quran/data/local/database/model/main_list_item_model.dart';
import 'package:supplications_from_quran/presentation/widgets/bottom_buttons.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class AyahItem extends StatelessWidget {
  const AyahItem({
    Key? key,
    required this.itemIndex,
    required this.item,
  }) : super(key: key);

  final int itemIndex;
  final MainListItemModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Text(
                  item.ayahArabic,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Quran',
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                width: double.infinity,
                child: Text(
                  item.ayahTranslation,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                item.ayahSource,
                style: TextStyle(
                  color: myColor.mainAccentColor.withOpacity(0.5),
                ),
              ),
              ExpansionTile(
                key: PageStorageKey<int>(itemIndex),
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                childrenPadding: EdgeInsets.zero,
                maintainState: true,
                title: const Text(''),
                children: [
                  BottomButtons(item: item),
                ],
              ),
              const SizedBox(height: 16),
              CircleAvatar(
                backgroundColor: myColor.iconPrimaryColor.withOpacity(0.5),
                child: Text(
                  item.id.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: myColor.mainPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
