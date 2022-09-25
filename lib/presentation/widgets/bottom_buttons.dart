import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supplications_from_quran/data/local/database/model/main_list_item_model.dart';
import 'package:supplications_from_quran/presentation/widgets/ayah_for_picture_share.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class BottomButtons extends StatelessWidget {
  BottomButtons({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MainListItemModel item;
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: myColors.iconPrimaryColor,
            child: Icon(
              CupertinoIcons.doc_on_doc,
              color: myColors.mainPrimaryColor,
            ),
          ),
          onPressed: () {
            FlutterClipboard.copy(
                    '${item.ayahArabic}\n\n${item.ayahTranslation}\n\n${item.ayahSource}')
                .then(
              (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: myColors.mainPrimaryColor,
                    content: const Text('Скопировано'),
                    duration: const Duration(milliseconds: 750),
                  ),
                );
              },
            );
          },
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: myColors.iconPrimaryColor,
            child: Icon(
              CupertinoIcons.share,
              color: myColors.mainPrimaryColor,
            ),
          ),
          onPressed: () {
            Share.share(
                '${item.ayahArabic}\n\n${item.ayahTranslation}\n\n${item.ayahSource}');
          },
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: myColors.iconPrimaryColor,
            child: Icon(
              CupertinoIcons.photo,
              color: myColors.mainPrimaryColor,
            ),
          ),
          onPressed: () async {
            final unit8List = await _screenshotController.captureFromWidget(
              AyahForPictureShare(item: item),
              delay: const Duration(seconds: 0),
            );
            Directory? pictureDirectory = Platform.isAndroid
                    ? await getExternalStorageDirectory()
                    : await getApplicationDocumentsDirectory();
            File file = File('${pictureDirectory!.path}/ayah_${item.id}.jpg');
            await file.writeAsBytes(unit8List);

            Directory? audioDirectory = Platform.isAndroid
                ? await getExternalStorageDirectory()
                : await getApplicationSupportDirectory();

            String path = join(audioDirectory!.path, 'ayah_${item.id}.mp3');
            ByteData data = await rootBundle.load(join('assets/audios', 'ayah_${item.id}.mp3'));
            List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
            File fileAudio = File(path);
            await fileAudio.writeAsBytes(bytes);

            await Share.shareFiles(
              [file.path, fileAudio.path],
              sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
            );
          },
        ),
      ],
    );
  }
}
