import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supplications_from_quran/presentation/items/ayah_item.dart';
import 'package:supplications_from_quran/until/state/main_list_state.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class MainAyahsList extends StatelessWidget {
  const MainAyahsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 64),
          decoration: BoxDecoration(
            color: myColor.mainPrimaryColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: SmoothPageIndicator(
            controller: context.watch<MainListState>().geMainListController,
            axisDirection: Axis.vertical,
            count: 50,
            effect: ScrollingDotsEffect(
              maxVisibleDots: 11,
              dotWidth: 8,
              dotHeight: 8,
              dotColor: myColor.dotColor,
              activeDotColor: myColor.mainAccentColor,
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: context.watch<MainListState>().geMainListController,
            scrollDirection: Axis.vertical,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return AyahItem(itemIndex: index);
            },
          ),
        ),
      ],
    );
  }
}
