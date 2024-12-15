import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../items/supplication_pageview_item.dart';
import '../state/app_player_state.dart';
import '../state/content_settings_state.dart';
import '../state/main_app_state.dart';
import '../widgets/main_error_text.dart';
import '../widgets/media_card.dart';

class SupplicationPageView extends StatefulWidget {
  const SupplicationPageView({
    super.key,
  });

  @override
  State<SupplicationPageView> createState() => _SupplicationPageViewState();
}

class _SupplicationPageViewState extends State<SupplicationPageView> {
  late final Future<List<SupplicationEntity>> _futureSupplications;

  @override
  void initState() {
    super.initState();
    _futureSupplications = Provider.of<MainAppState>(context, listen: false).fetchAllSupplications(tableName: 'Table_of_supplications_${AppConstraints.appLocales[Provider.of<ContentSettingsState>(context, listen: false).getAppLocaleIndex].languageCode}');
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
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
                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: mainAppState.getPageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final SupplicationEntity model = snapshot.data![index];
                          return Padding(
                            padding: AppStyles.mardingMiniWithoutBottom,
                            child: Column(
                              children: [
                                Expanded(
                                  child: SupplicationPageViewItem(
                                    model: model,
                                    index: index,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                MediaCard(supplicationModel: model),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: mainAppState.getPageController,
                      count: snapshot.data!.length,
                      onDotClicked: (index) => mainAppState.getPageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.slowMiddle,
                      ),
                      effect: ScrollingDotsEffect(
                        maxVisibleDots: 7,
                        dotWidth: 8,
                        dotHeight: 8,
                        activeDotColor: appColors.primary,
                      ),
                    ),
                  ],
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
