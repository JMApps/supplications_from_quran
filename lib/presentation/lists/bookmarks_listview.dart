import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../items/supplication_listview_item.dart';
import '../state/app_player_state.dart';
import '../state/main_app_state.dart';
import '../widgets/main_error_text.dart';
import '../widgets/media_card.dart';

class BookmarksListView extends StatelessWidget {
  const BookmarksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Consumer<MainAppState>(
        builder: (context, mainAppState, _) {
          return FutureBuilder<List<SupplicationEntity>>(
            future: mainAppState.fetchFavoriteSupplications(
              tableName: locale.tableName,
              favoriteIds: mainAppState.getFavoriteSupplicationIds,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return MainErrorText(text: snapshot.error.toString());
              }
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return Center(
                  child: Padding(
                    padding: AppStyles.mainMarding,
                    child: Text(
                      locale.bookmarksIsEmpty,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                );
              }
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Scrollbar(
                  child: ListView.builder(
                    padding: AppStyles.mardingMiniWithoutBottom,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final SupplicationEntity model = snapshot.data![index];
                      return Column(
                        children: [
                          SupplicationListViewItem(
                            model: model,
                            index: index,
                          ),
                          const SizedBox(height: 4),
                          MediaCard(supplicationModel: model),
                        ],
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          );
        },
      ),
    );
  }
}
