import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomPlayerBar extends StatelessWidget {
  const MainBottomPlayerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff212126),
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
              icon:
                  const Icon(CupertinoIcons.backward_end, color: Colors.white),
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
              onPressed: () {},
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
