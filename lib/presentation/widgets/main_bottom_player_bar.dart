import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/until/state/main_list_state.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class MainBottomPlayerBar extends StatelessWidget {
  const MainBottomPlayerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.mainPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(55, 35),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: const Icon(CupertinoIcons.backward_end, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: const Icon(CupertinoIcons.play, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: const Icon(CupertinoIcons.forward_end, color: Colors.white),
              onPressed: () {
                context.read<MainListState>().toPageAyah(3);
              },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: const Icon(CupertinoIcons.arrow_2_circlepath, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 20,
              icon: const Icon(CupertinoIcons.arrow_2_squarepath, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
