import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../state/content_settings_state.dart';

class SupplicationListViewItem extends StatelessWidget {
  const SupplicationListViewItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SupplicationEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.borderWithoutBottom
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: AppStyles.mainMarding,
        child: Consumer<ContentSettingsState>(
          builder: (context, contentSettingsState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '﴿ ${model.ayahArabic} ﴾',
                  style: TextStyle(
                    fontSize: AppStyles.textSizes[contentSettingsState.getArabicTextSizeIndex],
                    fontFamily: AppStyles.arabicTextFont[contentSettingsState.getArabicFontIndex],
                    color: appTheme.brightness == Brightness.light ? contentSettingsState.getArabicLightTextColor : contentSettingsState.getArabicDarkTextColor,
                    height: 1.75,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: AppStyles.textAligns[contentSettingsState.getTextArabicAlignIndex],
                ),
                const SizedBox(height: 16),
                Text(
                  model.ayahTranslation,
                  style: TextStyle(
                    fontSize: AppStyles.textSizes[contentSettingsState.getTextSizeIndex],
                    fontFamily: AppStyles.textFont[contentSettingsState.getFontIndex],
                    color: appTheme.brightness == Brightness.light ? contentSettingsState.getLightTextColor : contentSettingsState.getDarkTextColor,
                  ),
                  textAlign: AppStyles.textAligns[contentSettingsState.getTextAlignIndex],
                ),
                const SizedBox(height: 16),
                Text(
                  model.ayahSource,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppStyles.textFont[contentSettingsState.getFontIndex],
                    color: appTheme.colorScheme.secondary,
                  ),
                  textAlign: AppStyles.textAligns[contentSettingsState.getTextAlignIndex],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
