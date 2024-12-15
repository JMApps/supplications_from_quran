import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../state/content_settings_state.dart';

class ArabicAlignsDropDown extends StatelessWidget {
  const ArabicAlignsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: AppStyles.mainMardingHorizontal,
      visualDensity: VisualDensity.compact,
      title: Text(
        appLocale.arabicAlignText,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Consumer<ContentSettingsState>(
        builder: (context, settingsState, _) {
          return DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            borderRadius: AppStyles.mainBorder,
            padding: AppStyles.mainMardingMini,
            elevation: 1,
            alignment: Alignment.centerRight,
            value: settingsState.getTextArabicAlignIndex,
            items: List.generate(
              AppStyles.textAligns.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                alignment: Alignment.center,
                child: Icon(
                  AppStyles.textAlignIcons[index],
                  color: settingsState.getTextArabicAlignIndex == index ? appColors.primary : appColors.onSurface,
                ),
              ),
            ),
            onChanged: (newIndex) => settingsState.changeArabicTextAlignIndex = newIndex!,
            underline: const SizedBox(),
          );
        },
      ),
    );
  }
}
