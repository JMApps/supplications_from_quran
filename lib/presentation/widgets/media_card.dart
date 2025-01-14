import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../state/app_player_state.dart';
import '../state/main_app_state.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({
    super.key,
    required this.supplicationModel,
  });

  final SupplicationEntity supplicationModel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      margin: AppStyles.mardingBottomMini,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.borderWithoutTop,
      ),
      child: SingleChildScrollView(
        child: Consumer2<AppPlayerState, MainAppState>(
          builder: (context, playerState, mainState, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  visualDensity: VisualDensity.comfortable,
                  onPressed: () {
                    playerState.playTrack(
                      nameAudio: supplicationModel.nameAudio,
                      trackId: supplicationModel.id,
                    );
                  },
                  icon: Icon(playerState.getPlayingState ? Icons.stop_circle_outlined : Icons.play_circle_outline_rounded),
                ),
                IconButton(
                  visualDensity: VisualDensity.comfortable,
                  onPressed: () {
                    playerState.changeRepeatState(trackId: supplicationModel.id);
                  },
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: playerState.getRepeatState ? appColors.primary : appColors.onSurface,
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.comfortable,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: AppStyles.mardingMiniWithoutTop,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                mainState.shareAyah('${supplicationModel.ayahArabic}\n\n${supplicationModel.ayahTranslation}\n\n${supplicationModel.ayahSource}');
                              },
                              label: Text(locale.share),
                              icon: Icon(Icons.ios_share_rounded),
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                mainState.copyAyah('${supplicationModel.ayahArabic}\n\n${supplicationModel.ayahTranslation}\n\n${supplicationModel.ayahSource}');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: appColors.secondaryContainer,
                                    duration: const Duration(milliseconds: 350),
                                    content: Text(
                                      locale.copied,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: appColors.onSurface,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              label: Text(locale.copy),
                              icon: Icon(Icons.copy),
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                mainState.takeScreenshot(supplicationModel);
                              },
                              label: Text(locale.sharePic),
                              icon: Icon(Icons.image_outlined),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.ios_share_rounded),
                ),
                IconButton(
                  visualDensity: VisualDensity.comfortable,
                  onPressed: () {
                    mainState.toggleSupplicationFavorite(supplicationId: supplicationModel.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: appColors.secondaryContainer,
                        duration: const Duration(milliseconds: 350),
                        content: Text(
                          mainState.supplicationIsFavorite(supplicationModel.id) ? locale.added : locale.removed,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: appColors.onSurface,
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    mainState.supplicationIsFavorite(supplicationModel.id) ? Icons.bookmark : Icons.bookmark_border_rounded,
                    color: appColors.primary,
                  ),
                ),
                CircleAvatar(
                  radius: 17.5,
                  child: Text(
                    supplicationModel.id.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: AppConstraints.fontGilroy,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
