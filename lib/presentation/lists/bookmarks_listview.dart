import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/application/state/main_app_state.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';
import 'package:supplications_from_quran/presentation/items/supplication_listview_item.dart';
import 'package:supplications_from_quran/presentation/widgets/item_sheet_bottom.dart';

class BookmarksListView extends StatelessWidget {
  const BookmarksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<SupplicationModel>>(
      future: context.watch<MainAppState>().getSupplicationInteractor.getFavoriteSupplications(tableName: locale.tableName),
      builder: (BuildContext context,
          AsyncSnapshot<List<SupplicationModel>> snapshot) {
        if (snapshot.hasData) {
          return Scrollbar(
            child: ListView.builder(
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
            ),
          );
        } else {
          return Center(
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Text(
                locale.bookmarksIsEmpty,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
