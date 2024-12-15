import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../state/content_settings_state.dart';

class ArabicColorPickers extends StatefulWidget {
  const ArabicColorPickers({super.key});

  @override
  State<ArabicColorPickers> createState() => _ArabicColorPickersState();
}

class _ArabicColorPickersState extends State<ArabicColorPickers> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return ListTile(
      contentPadding: AppStyles.mainMardingHorizontal,
      visualDensity: VisualDensity.compact,
      title: Text(
        appLocale.arabicTextColor,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Consumer<ContentSettingsState>(
        builder: (context, settingsState, _) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filledTonal(
                onPressed: () {
                  _showColorPicker(isDark: false, settingsState: settingsState);
                },
                tooltip: appLocale.forLightTheme,
                icon: Icon(
                  Icons.palette,
                  color: settingsState.getArabicLightTextColor,
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  _showColorPicker(isDark: true, settingsState: settingsState);
                },
                tooltip: appLocale.forDarkTheme,
                icon: Icon(
                  Icons.palette,
                  color: settingsState.getArabicDarkTextColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showColorPicker({required bool isDark, required ContentSettingsState settingsState}) {
    final appLocale = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        actionsPadding: AppStyles.mainMardingMini,
        title: Text(
          isDark ? appLocale.forDarkTheme : appLocale.forLightTheme,
          style: TextStyle(fontSize: 18.0),
        ),
        content: Material(
          color: Colors.transparent,
          child: MaterialColorPicker(
            alignment: WrapAlignment.center,
            iconSelected: Icons.check_circle,
            elevation: 0.5,
            onlyShadeSelection: true,
            onColorChange: (Color? color) => isDark ? settingsState.changeArabicDarkColor = color! : settingsState.changeArabicLightColor = color!,
            selectedColor: isDark ? settingsState.getArabicDarkTextColor : settingsState.getArabicLightTextColor,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              appLocale.close,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
