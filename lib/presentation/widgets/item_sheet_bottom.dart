import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../../data/models/supplication_model.dart';
import '../state/app_player_state.dart';

class ItemSheetBottom extends StatelessWidget {
  const ItemSheetBottom({
    super.key,
    required this.model,
  });

  final SupplicationModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMardingMini,
      shape: AppStyles.mainShape,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
                icon: Icon(player.getCurrentTrackItem == model.id && player.getPlayingState ? CupertinoIcons.stop_circle : CupertinoIcons.play),
              );
            },
          ),
          Consumer<AppPlayerState>(
            builder: (context, player, _) {
              return IconButton(
                onPressed: () {
                  player.changeRepeatState(trackId: model.id);
                },
                icon: Icon(CupertinoIcons.arrow_2_squarepath, color: player.getCurrentTrackItem == model.id && player.getRepeatState ? appColors.primary : appColors.onSurface),
              );
            },
          ),
          IconButton(
            onPressed: () {
              // Bottom sheet
            },
            icon: const Icon(CupertinoIcons.share_up),
          ),
          CircleAvatar(
            child: Text(
              model.id.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
