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

import '../../core/strings/app_constraints.dart';
import '../../domain/entities/supplication_entity.dart';
import '../../domain/usecases/supplication_use_case.dart';
import '../widgets/screenshot_page.dart';

class MainAppState extends ChangeNotifier {
  final _favoriteSettingsBox = Hive.box(AppConstraints.keyFavoriteSupplications);

  MainAppState(this._supplicationUseCase) {
    _favoriteSupplications = _favoriteSettingsBox.get(AppConstraints.keyFavoriteSupplicationIds, defaultValue: <int>[]);
  }

  final SupplicationUseCase _supplicationUseCase;

  final _screenshotController = ScreenshotController();

  final ItemScrollController _scrollController = ItemScrollController();

  ItemScrollController get getScrollController => _scrollController;

  final PageController _pageController = PageController();

  PageController get getPageController => _pageController;

  List<int> _favoriteSupplications = [];

  List<int> get getFavoriteSupplications => _favoriteSupplications;

  Future<List<SupplicationEntity>> fetchAllSupplications({required String tableName}) async {
    return await _supplicationUseCase.getAllSupplications(tableName: tableName);
  }

  Future<List<SupplicationEntity>> fetchFavoriteSupplications({required String tableName, required List<int> favoriteIds}) async {
    return await _supplicationUseCase.getFavoriteSupplications(tableName: tableName, favoriteIds: favoriteIds);
  }

  void toggleSupplicationFavorite({required int supplicationId}) {
    final bool exist = _favoriteSupplications.contains(supplicationId);
    if (exist) {
      _favoriteSupplications.remove(supplicationId);
    } else {
      _favoriteSupplications.add(supplicationId);
    }
    _favoriteSettingsBox.put(AppConstraints.keyFavoriteSupplications, _favoriteSupplications);
    notifyListeners();
  }

  bool supplicationIsFavorite(int supplicationId) {
    return _favoriteSupplications.contains(supplicationId);
  }

  void get setDefaultListItem {
    final Random random = Random();
    _scrollController.scrollTo(
      index: random.nextInt(54),
      duration: const Duration(milliseconds: 500),
    );
  }

  void get setDefaultPageItem {
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

  void copyAyah(String content) async {
    await FlutterClipboard.copy(content);
  }

  void shareAyah(String content) async {
    await Share.share(content, sharePositionOrigin: const Rect.fromLTRB(0, 0, 100, 100));
  }

  void takeScreenshot(SupplicationEntity model) async {
    final unit8List = await _screenshotController.captureFromWidget(
      ScreenshotPage(model: model),
      delay: const Duration(milliseconds: 50),
    );
    Directory? tempPath = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();
    File picture = File('${tempPath!.path}/ayah_${model.id}.jpg');

    ByteData data = await rootBundle.load(join('assets/audios', '${model.nameAudio}.mp3'));
    List<int> audioBytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    String audioPath = join(tempPath.path, '${model.nameAudio}.mp3');

    await picture.writeAsBytes(unit8List);
    await File(audioPath).writeAsBytes(audioBytes, flush: true);

    XFile xPicture = XFile(picture.path);
    XFile xAudio = XFile(audioPath);

    await Share.shareXFiles(
      [xPicture, xAudio],
      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
