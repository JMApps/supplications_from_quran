import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/strings/app_constraints.dart';
import '../lists/bookmarks_listview.dart';
import '../lists/supplication_listview.dart';
import '../lists/supplication_pageview.dart';
import '../state/main_app_state.dart';
import 'app_settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<Widget> _mainWidgets;

  @override
  void initState() {
    super.initState();
    _mainWidgets = [
      const SupplicationsListView(),
      const SupplicationPageView(),
      const BookmarksListView(),
      const AppSettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<MainAppState>(
      builder: (context, mainAppState, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(locale.appName),
            actions: [
              mainAppState.getCurrentIndex == 0 ? IconButton(
                onPressed: () {
                  mainAppState.setDefaultListItem;
                  },
                tooltip: locale.randomAyah,
                icon: const Icon(CupertinoIcons.arrow_2_squarepath),
              ) : const SizedBox(),
              mainAppState.getCurrentIndex == 1 ? IconButton(
                onPressed: () {
                  mainAppState.setDefaultPageItem;
                },
                tooltip: locale.randomAyah,
                icon: const Icon(CupertinoIcons.arrow_2_squarepath),
              ) : const SizedBox(),
            ],
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _mainWidgets[mainAppState.getCurrentIndex],
          ),
          bottomNavigationBar: SalomonBottomBar(
            items: [
              SalomonBottomBarItem(
                icon: Icon(mainAppState.getCurrentIndex == 0 ? CupertinoIcons.collections_solid : CupertinoIcons.collections),
                title: Text(
                  locale.cards,
                  style: const TextStyle(fontFamily: AppConstraints.fontRaleway),
                ),
              ),
              SalomonBottomBarItem(
                icon: Icon(mainAppState.getCurrentIndex == 1 ? CupertinoIcons.book_solid : CupertinoIcons.book),
                title: Text(
                  locale.pages,
                  style: const TextStyle(fontFamily: AppConstraints.fontRaleway),
                ),
              ),
              SalomonBottomBarItem(
                icon: Icon(mainAppState.getCurrentIndex == 2 ?CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark),
                title: Text(
                  locale.bookmarks,
                  style: const TextStyle(fontFamily: AppConstraints.fontRaleway),
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(CupertinoIcons.settings),
                title: Text(
                  locale.settings,
                  style: const TextStyle(fontFamily: AppConstraints.fontRaleway),
                ),
              ),
            ],
            selectedItemColor: appColors.primary,
            selectedColorOpacity: 0.25,
            currentIndex: mainAppState.getCurrentIndex,
            onTap: (int index) => mainAppState.setIndex = index,
          ),
        );
      },
    );
  }
}
