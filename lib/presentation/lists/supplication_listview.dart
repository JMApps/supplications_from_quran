import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:supplications_from_quran/core/strings/app_constraints.dart';
import 'package:supplications_from_quran/presentation/state/content_settings_state.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../items/supplication_listview_item.dart';
import '../state/app_player_state.dart';
import '../state/main_app_state.dart';
import '../widgets/main_error_text.dart';
import '../widgets/media_card.dart';

class SupplicationsListView extends StatefulWidget {
  const SupplicationsListView({
    super.key,
  });

  @override
  State<SupplicationsListView> createState() => _SupplicationsListViewState();
}

class _SupplicationsListViewState extends State<SupplicationsListView> {
  late final Future<List<SupplicationEntity>> _futureSupplications;

  @override
  void initState() {
    super.initState();
    _futureSupplications = Provider.of<MainAppState>(context, listen: false).fetchAllSupplications(tableName: 'Table_of_supplications_${AppConstraints.appLocales[Provider.of<ContentSettingsState>(context, listen: false).getAppLocaleIndex].languageCode}');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: FutureBuilder<List<SupplicationEntity>>(
        future: _futureSupplications,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MainErrorText(text: snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return Consumer<MainAppState>(
              builder: (context, mainAppState, _) {
                return ScrollablePositionedList.builder(
                  itemScrollController: mainAppState.getScrollController,
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
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
