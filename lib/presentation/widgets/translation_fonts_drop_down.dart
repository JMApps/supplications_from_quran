import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../core/strings/app_constraints.dart';
import '../state/content_settings_state.dart';

class TranslationFontsDropDown extends StatelessWidget {
  const TranslationFontsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 17.0, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    return ListTile(
      contentPadding: AppStyles.mainMardingHorizontal,
      visualDensity: VisualDensity.compact,
      title: Text(
        appLocale.textFont,
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
            value: settingsState.getFontIndex,
            items: List.generate(
              AppStyles.textFont.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                alignment: Alignment.center,
                child: Text(AppStyles.textFont[index], style: settingsState.getFontIndex == index ? itemSelectedTextStyle : TextStyle(fontSize: 18.0)),
              ),
            ),
            onChanged: (newIndex) => settingsState.changeFontIndex = newIndex!,
            underline: const SizedBox(),
          );
        },
      ),
    );
  }
}
