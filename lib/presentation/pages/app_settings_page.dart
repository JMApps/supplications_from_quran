import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/content_settings_state.dart';
import '../widgets/always_on_list_tile.dart';
import '../widgets/app_locale_drop_down.dart';
import '../widgets/arabic_aligns_drop_down.dart';
import '../widgets/arabic_color_pickers.dart';
import '../widgets/arabic_fonts_drop_down.dart';
import '../widgets/arabic_sizes_drop_down.dart';
import '../widgets/text_color_pickers.dart';
import '../widgets/text_sizes_drop_down.dart';
import '../widgets/theme_color_picker.dart';
import '../widgets/theme_mode_drop_down.dart';
import '../widgets/translation_aligns_drop_down.dart';
import '../widgets/translation_fonts_drop_down.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<ContentSettingsState>(
        builder: (context, settingsState, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppLocaleDropDown(),
              const Divider(indent: 16, endIndent: 16),
              ThemeModeDropDown(),
              const Divider(indent: 16, endIndent: 16),
              ThemeColorPicker(),
              const Divider(indent: 16, endIndent: 16),
              AlwaysOnListTile(),
              const Divider(indent: 16, endIndent: 16),
              ArabicFontsDropDown(),
              const Divider(indent: 16, endIndent: 16),
              TranslationFontsDropDown(),
              const Divider(indent: 16, endIndent: 16),
              ArabicAlignsDropDown(),
              const Divider(indent: 16, endIndent: 16),
              TranslationAlignsDropDown(),
              const Divider(indent: 16, endIndent: 16),
              ArabicSizesDropDown(),
              const Divider(indent: 16, endIndent: 16),
              TextSizesDropDown(),
              const Divider(indent: 16, endIndent: 16),
              ArabicColorPickers(),
              const Divider(indent: 16, endIndent: 16),
              TextColorPickers(),
              const Divider(indent: 16, endIndent: 16),
            ],
          );
        },
      ),
    );
  }
}
