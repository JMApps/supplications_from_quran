import 'package:flutter/material.dart';
import 'package:supplications_from_quran/presentation/lists/favorite_ayahs_list.dart';
import 'package:supplications_from_quran/presentation/widgets/favorite_app_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: FavoriteAppBar(),
      ),
      body: FavoriteAyahList(),
    );
  }
}
