import 'package:flutter/material.dart';
import 'package:supplications_from_quran/presentation/widgets/bottom_buttons.dart';
import 'package:supplications_from_quran/until/theme/app_theme.dart';

class AyahItem extends StatelessWidget {
  const AyahItem({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(left: 16, bottom: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: const Text(
                  'وَإِذَا قِيلَ لَهُمۡ ءَامِنُواْ كَمَآ ءَامَنَ ٱلنَّاسُ قَالُوٓاْ أَنُؤۡمِنُ كَمَآ ءَامَنَ ٱلسُّفَهَآءُۗ أَلَآ إِنَّهُمۡ هُمُ ٱلسُّفَهَآءُ وَلَٰكِن لَّا يَعۡلَمُونَ ',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Quran',
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                width: double.infinity,
                child: const Text(
                  'Когда им говорят: «Уверуйте так, как уверовали люди», - они отвечают: «Неужели мы уверуем так, как уверовали глупцы?». Воистину, именно они являются глупцами, но они не знают этого.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ExpansionTile(
                key: PageStorageKey<int>(itemIndex),
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                childrenPadding: EdgeInsets.zero,
                maintainState: true,
                title: const Text(''),
                children: const [
                  BottomButtons(),
                ],
              ),
              const SizedBox(height: 16),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.iconPrimaryColor.withOpacity(0.5),
                child: Text(
                  '$itemIndex',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.mainPrimaryColor.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
