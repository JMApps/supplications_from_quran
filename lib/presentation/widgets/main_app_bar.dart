import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Мольбы из Корана'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(55, 35),
        ),
      ),
      actions: [
        IconButton(
          splashRadius: 20,
          icon: const Icon(CupertinoIcons.share),
          onPressed: () {},
        ),
      ],
    );
  }
}
