import 'dart:io';
import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supplications_from_quran/application/constraints/app_constraints.dart';
import 'package:supplications_from_quran/domain/interactors/supplication_interactor.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';
import 'package:supplications_from_quran/presentation/widgets/screenshot_page.dart';

class MainAppState extends ChangeNotifier {
  final _favoriteSettingsBox = Hive.box(AppConstraints.keyFavoriteSupplications);

  final _screenshotController = ScreenshotController();

  final ItemScrollController _scrollController = ItemScrollController();

  ItemScrollController get getScrollController => _scrollController;

  final PageController _pageController = PageController();

  PageController get getPageController => _pageController;

  final SupplicationInteractor _interactor = SupplicationInteractor();

  SupplicationInteractor get getSupplicationInteractor => _interactor;

  List<int> _favoriteSupplications = [];

  List<int> get getFavoriteSupplications => _favoriteSupplications;

  MainAppState() {
    _favoriteSupplications = _favoriteSettingsBox.get(AppConstraints.keyFavoriteSupplicationIds, defaultValue: <int>[]);
  }

  toggleFavorite(int id) {
    final exist = _favoriteSupplications.contains(id);
    if (exist) {
      _favoriteSupplications.remove(id);
    } else {
      _favoriteSupplications.add(id);
    }
    _favoriteSettingsBox.put(AppConstraints.keyFavoriteSupplicationIds, _favoriteSupplications);
    notifyListeners();
  }

  bool supplicationIsFavorite(int id) {
    final exist = _favoriteSupplications.contains(id);
    return exist;
  }

  setDefaultListItem() {
    final Random random = Random();
    _scrollController.scrollTo(
      index: random.nextInt(54),
      duration: const Duration(milliseconds: 500),
    );
  }

  setDefaultPageItem() {
    final Random random = Random();
    _pageController.animateToPage(
      random.nextInt(54),
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  int _currentIndex = 0;

  int get getCurrentIndex => _currentIndex;

  set setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  set copyContent(String content) {
    FlutterClipboard.copy(content);
  }

  set shareContent(String content) {
    Share.share(content, sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2));
  }

  takeScreenshot(SupplicationModel item) async {
    final unit8List = await _screenshotController.captureFromWidget(
      ScreenshotPage(model: item),
      delay: const Duration(milliseconds: 50),
    );
    Directory? tempPath = Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory();

    File picture = File('${tempPath!.path}/ayah_${item.id}.jpg');

    ByteData data = await rootBundle.load(join('assets/audios', '${item.nameAudio}.mp3'));
    List<int> audioBytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    String audioPath = join(tempPath.path, '${item.nameAudio}.mp3');

    await picture.writeAsBytes(unit8List);
    await File(audioPath).writeAsBytes(audioBytes, flush: true);

    XFile xPicture = XFile(picture.path);
    XFile xAudio = XFile(audioPath);

    await Share.shareXFiles(
      [xPicture, xAudio],
      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
    );
  }
}
