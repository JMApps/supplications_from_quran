import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supplications_from_quran/application/state/main_app_state.dart';
import 'package:supplications_from_quran/application/themes/app_themes.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';

class ItemSheetBottom extends StatelessWidget {
  const ItemSheetBottom({super.key, required this.model});

  final SupplicationModel model;

  @override
  Widget build(BuildContext context) {
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Card(
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: appColors.titleColor.withOpacity(0.75),
            child: Text(
              model.id.toString(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.play),
          ),
          IconButton(
            onPressed: () {
              mainAppState.copyContent = '${model.ayahArabic}\n\n${model.ayahTranslation}\n\n${model.ayahSource}';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: appColors.titleColor,
                  duration: const Duration(milliseconds: 750),
                  content: Text(
                    locale.copied,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(CupertinoIcons.doc_on_doc),
          ),
          IconButton(
            onPressed: () {
              mainAppState.shareContent = '${model.ayahArabic}\n\n${model.ayahTranslation}\n\n${model.ayahSource}';
            },
            icon: const Icon(CupertinoIcons.share),
          ),
          IconButton(
            onPressed: () {
              mainAppState.takeScreenshot(model);
            },
            icon: const Icon(CupertinoIcons.photo_on_rectangle),
          ),
          IconButton(
            onPressed: () {
              mainAppState.addRemoveFavorite(tableName: locale.tableName, supplicationId: model.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: appColors.titleColor,
                  duration: const Duration(milliseconds: 750),
                  content: Text(
                    model.favoriteState == 0 ? locale.added : locale.removed,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            icon: Icon(
              model.favoriteState == 1
                  ? CupertinoIcons.bookmark_solid
                  : CupertinoIcons.bookmark,
              color: appColors.titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
