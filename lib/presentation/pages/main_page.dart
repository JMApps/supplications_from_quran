import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:supplications_from_quran/application/state/main_app_state.dart';
import 'package:supplications_from_quran/application/themes/app_themes.dart';
import 'package:supplications_from_quran/presentation/lists/bookmarks_listview.dart';
import 'package:supplications_from_quran/presentation/lists/supplication_listview.dart';
import 'package:supplications_from_quran/presentation/lists/supplication_pageview.dart';
import 'package:supplications_from_quran/presentation/pages/app_settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _mainWidgets = [
    const SupplicationsListView(),
    const SupplicationPageView(),
    const BookmarksListView(),
    const AppSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.appName),
        actions: [
          mainAppState.getCurrentIndex == 1
              ? IconButton(
                  onPressed: () {
                    mainAppState.setDefaultPageItem();
                  },
                  tooltip: locale.randomAyah,
                  icon: const Icon(
                    CupertinoIcons.arrow_2_squarepath,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _mainWidgets[mainAppState.getCurrentIndex],
      ),
      floatingActionButton: mainAppState.getCurrentIndex == 0
          ? FloatingActionButton.small(
              onPressed: () {
                mainAppState.setDefaultListItem();
              },
              tooltip: locale.randomAyah,
              backgroundColor: appColors.titleColor,
              child: const Icon(
                CupertinoIcons.arrow_2_squarepath,
                color: Colors.white,
              ),
            )
          : const SizedBox(),
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.collections),
            title: Text(
              locale.cards,
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.book),
            title: Text(
              locale.pages,
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.bookmark),
            title: Text(
              locale.bookmarks,
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.settings),
            title: Text(
              locale.settings,
            ),
          ),
        ],
        selectedItemColor: appColors.titleColor,
        selectedColorOpacity: 0.25,
        currentIndex: mainAppState.getCurrentIndex,
        onTap: (int index) => mainAppState.setIndex = index,
      ),
    );
  }
}
