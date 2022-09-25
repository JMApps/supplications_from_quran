import 'package:flutter/material.dart';
import 'package:supplications_from_quran/data/local/database/model/main_list_item_model.dart';

class AyahForPictureShare extends StatelessWidget {
  const AyahForPictureShare({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MainListItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade100,
        elevation: 5,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Wrap(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Text(
                      item.ayahArabic,
                      style: const TextStyle(
                        fontSize: 25,
                        fontFamily: 'Quran',
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    width: double.infinity,
                    child: Text(
                      item.ayahTranslation,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.ayahSource,
                    style: const TextStyle(
                      color: Colors.black26,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(indent: 16, endIndent: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/pictures/asgp.png',
                          width: 70,
                          height: 40,
                        ),
                        const SizedBox(width: 16),
                        Image.asset(
                          'assets/pictures/asgp.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Мольбы из Корана',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Gilroy',
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ));
  }
}
