import 'package:flutter/material.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';

class ScreenshotPage extends StatelessWidget {
  const ScreenshotPage({
    super.key,
    required this.model,
  });

  final SupplicationEntity model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      shape: AppStyles.mainShape,
      child: Padding(
        padding: AppStyles.mainMarding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '﴿ ${model.ayahArabic} ﴾',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: AppConstraints.fontHafs,
                color: appColors.primary,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              model.ayahTranslation,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: AppConstraints.fontRaleway,
                color: appColors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              model.ayahSource,
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppConstraints.fontRaleway,
                color: appColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}