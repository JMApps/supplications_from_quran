import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/application/state/app_player_state.dart';
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
    final bool isBookmark = mainAppState.supplicationIsFavorite(model.id);
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
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Consumer<AppPlayerState>(
            builder: (context, player, _) {
              return IconButton(
                onPressed: () {
                  player.playTrack(
                    nameAudio: model.nameAudio,
                    trackId: model.id,
                  );
                },
                icon: Icon(
                  player.getCurrentTrackItem == model.id &&
                          player.getPlayingState
                      ? CupertinoIcons.stop_circle
                      : CupertinoIcons.play,
                  size: 25,
                ),
              );
            },
          ),
          Consumer<AppPlayerState>(
            builder: (context, player, _) {
              return IconButton(
                onPressed: () {
                  player.changeRepeatState(trackId: model.id);
                },
                icon: Icon(
                  CupertinoIcons.arrow_2_circlepath,
                  color: player.getCurrentTrackItem == model.id &&
                          player.getRepeatState
                      ? appColors.titleColor
                      : appColors.mainDefault,
                  size: 25,
                ),
              );
            },
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
              mainAppState.toggleFavorite(model.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: appColors.titleColor,
                  duration: const Duration(milliseconds: 750),
                  content: Text(
                    isBookmark ? locale.removed : locale.added,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            icon: Icon(
              isBookmark
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
