import 'package:flutter/material.dart';
import 'package:supplications_from_quran/presentation/widgets/bottom_buttons.dart';

class AyahItem extends StatelessWidget {
  const AyahItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: const Text(
              'وَإِذَا قِيلَ لَهُمۡ ءَامِنُواْ كَمَآ ءَامَنَ ٱلنَّاسُ قَالُوٓاْ أَنُؤۡمِنُ كَمَآ ءَامَنَ ٱلسُّفَهَآءُۗ أَلَآ إِنَّهُمۡ هُمُ ٱلسُّفَهَآءُ وَلَٰكِن لَّا يَعۡلَمُونَ ',
              style: TextStyle(
                fontSize: 21,
                fontFamily: 'Quran',
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.start,
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
            ),
          ),
          const ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16),
            childrenPadding: EdgeInsets.zero,
            title: Text(
              'Дополнительно',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            children: [
              BottomButtons(),
            ],
          )
        ],
      ),
    );
  }
}
