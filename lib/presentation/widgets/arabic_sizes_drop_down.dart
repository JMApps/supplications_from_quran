import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supplications_from_quran/presentation/state/content_settings_state.dart';

import '../../../core/styles/app_styles.dart';
import '../../core/strings/app_constraints.dart';

class ArabicSizesDropDown extends StatelessWidget {
  const ArabicSizesDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 18.0, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    return ListTile(
      contentPadding: AppStyles.mainMardingHorizontal,
      visualDensity: VisualDensity.compact,
      title: Text(
        appLocale.arabicTextSize,
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
            value: settingsState.getArabicTextSizeIndex,
            items: List.generate(
              AppStyles.textSizes.length,
                  (index) => DropdownMenuItem<int>(
                value: index,
                alignment: Alignment.center,
                child: Text(appLocale.textSizeNames.split(', ')[index], style: settingsState.getArabicTextSizeIndex == index ? itemSelectedTextStyle : TextStyle(fontSize: 18.0)),
              ),
            ),
            onChanged: (newIndex) => settingsState.changeArabicTextSizeIndex = newIndex!,
            underline: const SizedBox(),
          );
        },
      ),
    );
  }
}
