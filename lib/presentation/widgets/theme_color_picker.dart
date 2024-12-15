import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../../core/styles/app_styles.dart';
import '../state/content_settings_state.dart';

class ThemeColorPicker extends StatefulWidget {
  const ThemeColorPicker({super.key});

  @override
  State<ThemeColorPicker> createState() => _ThemeColorPickerState();
}

class _ThemeColorPickerState extends State<ThemeColorPicker> {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return ListTile(
      contentPadding: AppStyles.mainMardingHorizontal,
      visualDensity: VisualDensity.compact,
      title: Text(
        appLocale.themeColor,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Consumer<ContentSettingsState>(
        builder: (context, settingsState, _) {
          return IconButton.filledTonal(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  alignment: Alignment.center,
                  actionsPadding: AppStyles.mainMardingMini,
                  title: Text(
                    appLocale.selectThemeColor,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  content: Material(
                    color: Colors.transparent,
                    child: MaterialColorPicker(
                      alignment: WrapAlignment.center,
                      iconSelected: Icons.check_circle,
                      elevation: 0.5,
                      onColorChange: (Color? color) => settingsState.changeAppThemeColor = color!,
                      selectedColor: settingsState.getAppThemeColor,
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
            },
            tooltip: appLocale.forLightTheme,
            icon: Icon(
              Icons.palette,
              color: settingsState.getAppThemeColor,
            ),
          );
        },
      ),
    );
  }
}
