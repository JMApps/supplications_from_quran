import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:supplications_from_quran/presentation/items/ayah_item.dart';

class MainAyahsList extends StatelessWidget {
  const MainAyahsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      controller: ScrollController(),
      child: ScrollablePositionedList.builder(
        itemScrollController: ItemScrollController(),
        padding: const EdgeInsets.only(
          left: 15,
          top: 122,
          right: 16,
          bottom: 80,
        ),
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return const AyahItem();
        },
      ),
    );
  }
}
