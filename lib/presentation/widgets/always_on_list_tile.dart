import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/styles/app_styles.dart';
import '../state/content_settings_state.dart';

class AlwaysOnListTile extends StatelessWidget {
  const AlwaysOnListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return ListTile(
      contentPadding: AppStyles.mainMardingHorizontal,
      visualDensity: VisualDensity.compact,
      title: Text(
        appLocale.displayAlways,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Consumer<ContentSettingsState>(
        builder: (context, settingsState, _) {
          return Switch(
            value: settingsState.getWakeLock,
            onChanged: (onChanged) {
              settingsState.changeWakeLock = onChanged;
            },
          );
        },
      ),
    );
  }
}
