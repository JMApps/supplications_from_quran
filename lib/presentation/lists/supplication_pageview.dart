import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supplications_from_quran/application/state/main_app_state.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';
import 'package:supplications_from_quran/application/themes/app_themes.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';
import 'package:supplications_from_quran/presentation/items/supplication_pageview_item.dart';
import 'package:supplications_from_quran/presentation/widgets/item_sheet_bottom.dart';

class SupplicationPageView extends StatelessWidget {
  const SupplicationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<SupplicationModel>>(
      future: mainAppState.getSupplicationInteractor.getAllSupplications(tableName: locale.tableName),
      builder: (BuildContext context, AsyncSnapshot<List<SupplicationModel>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: mainAppState.getPageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final SupplicationModel model = snapshot.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: SupplicationPageViewItem(
                            model: model,
                            index: index,
                          ),
                        ),
                        ItemSheetBottom(model: model),
                      ],
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                onDotClicked: (index) => mainAppState.getPageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.slowMiddle,
                ),
                controller: mainAppState.getPageController,
                count: snapshot.data!.length,
                effect: ScrollingDotsEffect(
                  maxVisibleDots: 7,
                  dotWidth: 8,
                  dotHeight: 8,
                  dotColor: Colors.grey,
                  activeDotColor: appColors.titleColor,
                ),
              ),
              const SizedBox(height: 8),
            ],
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
    );
  }
}
