import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/themes/app_themes.dart';
import '../state/content_settings_state.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettingsState, _) {
        final AppThemes appThemes = AppThemes(contentSettingsState.getAppThemeColor);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
          theme: appThemes.lightTheme,
          darkTheme: appThemes.darkTheme,
          themeMode: contentSettingsState.getThemeMode,
          home: const MainPage(),
        );
      },
    );
  }
}
