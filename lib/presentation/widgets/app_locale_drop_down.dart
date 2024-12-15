import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../state/content_settings_state.dart';

class AppLocaleDropDown extends StatelessWidget {
  const AppLocaleDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 18.0, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    return Consumer<ContentSettingsState>(
      builder: (BuildContext context, settings, _) {
        return ListTile(
          visualDensity: VisualDensity.comfortable,
          title: Text(
            appLocale.language,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: AppConstraints.fontRaleway,
            ),
          ),
          subtitle: Text(appLocale.appLanguage),
          leading: const Icon(Icons.language_rounded),
          trailing: DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            borderRadius: AppStyles.mainBorder,
            padding: AppStyles.mardingHorizontalMini,
            elevation: 1,
            alignment: Alignment.centerRight,
            value: settings.getAppLocaleIndex,
            items: List.generate(
              AppConstraints.appLocales.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                alignment: Alignment.center,
                child: Text(AppConstraints.appLocaleNames[index], style: settings.getAppLocaleIndex == index ? itemSelectedTextStyle : TextStyle(fontSize: 18.0)),
              ),
            ),
            onChanged: (newIndex) {
              settings.changeAppLocaleIndex = newIndex!;
            },
            underline: const SizedBox(),
          ),
        );
      },
    );
  }
}
