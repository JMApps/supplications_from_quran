import 'package:flutter/material.dart';
import 'package:supplications_from_quran/presentation/lists/main_ayahs_list.dart';
import 'package:supplications_from_quran/presentation/widgets/main_app_bar.dart';
import 'package:supplications_from_quran/presentation/widgets/main_bottom_player_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: MainAppBar()
      ),
      body: MainAyahsList(),
      bottomNavigationBar: MainBottomPlayerBar(),
    );
  }
}
