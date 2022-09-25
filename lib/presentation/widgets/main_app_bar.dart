import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);


  static const String iosLink = 'https://apps.apple.com/ru/app/%D0%BC%D0%BE%D0%BB%D1%8C%D0%B1%D1%8B-%D0%B8%D0%B7-%D0%BA%D0%BE%D1%80%D0%B0%D0%BD%D0%B0/id1578687261';
  static const String androidLink = 'https://play.google.com/store/apps/details?id=jmapps.supplicationsfromquran';

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
          onPressed: () {
            Share.share('Рекомендую скачать «Мольбы из Корана»:\n\nВерсия iOS: $iosLink\n\nВерсия android: $androidLink');
          },
        ),
      ],
    );
  }
}
