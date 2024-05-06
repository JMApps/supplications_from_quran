import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/application/state/content_settings_state.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';

class SupplicationPageViewItem extends StatelessWidget {
  const SupplicationPageViewItem({
    super.key,
    required this.model,
    required this.index,
  });

  final SupplicationModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final ContentSettingsState cs = Provider.of<ContentSettingsState>(context);
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      margin: const EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: AppStyles.mainMarding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                model.ayahArabic,
                style: TextStyle(
                  fontSize: cs.getArabicTextSize,
                  fontFamily: AppStyles.arabicTextFont[cs.getArabicFontIndex],
                  color: appTheme.brightness == Brightness.light ? cs.getArabicLightTextColor : cs.getArabicDarkTextColor,
                ),
                textDirection: TextDirection.rtl,
                textAlign: AppStyles.arabicTextAlign[cs.getTextArabicAlignIndex],
              ),
              const SizedBox(height: 16),
              Text(
                model.ayahTranslation,
                style: TextStyle(
                  fontSize: cs.getTextSize,
                  fontFamily: AppStyles.textFont[cs.getFontIndex],
                  color: appTheme.brightness == Brightness.light ? cs.getLightTextColor : cs.getDarkTextColor,
                ),
                textAlign: AppStyles.textAlign[cs.getTextAlignIndex],
              ),
              const SizedBox(height: 16),
              Text(
                model.ayahSource,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppStyles.textFont[cs.getFontIndex],
                  color: appTheme.colorScheme.secondary,
                ),
                textAlign: AppStyles.textAlign[cs.getTextAlignIndex],
              ),
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 20,
                backgroundColor: appTheme.colorScheme.secondary.withOpacity(0.75),
                child: Text(
                  model.id.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
