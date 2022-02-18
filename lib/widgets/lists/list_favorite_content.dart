import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:supplications_from_quran/widgets/items/item_favorite_content.dart';

class ListFavoriteContent extends StatelessWidget {
  ListFavoriteContent({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: ScrollablePositionedList.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemFavoriteContent(
            index: index,
            item: snapshot.data![index],
          );
        },
      ),
    );
  }
}
