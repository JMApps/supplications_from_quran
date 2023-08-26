import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:supplications_from_quran/application/state/app_player_state.dart';
import 'package:supplications_from_quran/application/state/main_app_state.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';
import 'package:supplications_from_quran/presentation/items/supplication_listview_item.dart';
import 'package:supplications_from_quran/presentation/widgets/item_sheet_bottom.dart';

class SupplicationsListView extends StatelessWidget {
  const SupplicationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: FutureBuilder<List<SupplicationModel>>(
        future: mainAppState.getSupplicationInteractor.getAllSupplications(tableName: locale.tableName),
        builder: (BuildContext context, AsyncSnapshot<List<SupplicationModel>> snapshot) {
          if (snapshot.hasData) {
            return ScrollablePositionedList.builder(
              itemScrollController: mainAppState.getScrollController,
              padding: AppStyles.mainMardingVertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final SupplicationModel model = snapshot.data![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SupplicationListViewItem(
                      model: model,
                      index: index,
                    ),
                    ItemSheetBottom(model: model),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: AppStyles.mainMarding,
                child: Text(
                  snapshot.error.toString(),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
