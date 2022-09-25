import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supplications_from_quran/presentation/items/favorite_ayah_item.dart';
import 'package:supplications_from_quran/until/state/main_list_state.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class FavoriteAyahList extends StatelessWidget {
  const FavoriteAyahList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return FutureBuilder(
      future:
          context.watch<MainListState>().getDatabaseQuery.getFavoriteAyahs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 64),
                    decoration: BoxDecoration(
                      color: myColor.mainPrimaryColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 0.5,
                        ),
                      ],
                    ),
                    child: SmoothPageIndicator(
                      controller: context.watch<MainListState>().getFavoriteListController,
                      axisDirection: Axis.vertical,
                      count: snapshot.data!.length,
                      effect: ScrollingDotsEffect(
                        maxVisibleDots: 11,
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: myColor.dotColor,
                        activeDotColor: myColor.mainAccentColor,
                      ),
                      onDotClicked: (int index) {
                        context.read<MainListState>().toPageAyah(index);
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: context.watch<MainListState>().getFavoriteListController,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FavoriteAyahItem(
                          itemIndex: index,
                          item: snapshot.data![index],
                        );
                      },
                    ),
                  ),
                ],
              )
            : const Center(
                child: Text(
                  'Избранного нет',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              );
      },
    );
  }
}
