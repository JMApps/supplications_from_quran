import 'package:flutter/material.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';

class ScreenshotPage extends StatelessWidget {
  const ScreenshotPage({super.key, required this.model});

  final SupplicationModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMarding,
      shape: AppStyles.mainShape,
      child: Padding(
        padding: AppStyles.mainMarding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              model.ayahArabic,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Uthmani',
                color: Colors.deepPurple.shade900,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              model.ayahTranslation,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              model.ayahSource,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: Colors.deepPurple.shade900,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
