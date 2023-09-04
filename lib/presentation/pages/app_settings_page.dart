import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/application/state/content_settings_state.dart';
import 'package:supplications_from_quran/application/styles/app_styles.dart';
import 'package:supplications_from_quran/application/themes/app_themes.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme headLineStyle = Theme.of(context).textTheme;
    final ThemeData appTheme = Theme.of(context);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: AppStyles.mainMarding,
      child: Consumer<ContentSettingsState>(
        builder: (context, settingsState, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                locale.arabicTextFont,
                style: headLineStyle.headlineMedium,
              ),
              const SizedBox(height: 8),
              CupertinoSlidingSegmentedControl(
                thumbColor: appTheme.colorScheme.titleColor.withOpacity(0.25),
                padding: const EdgeInsets.all(4),
                children: <int, Widget>{
                  0: Text(
                    'Uthmani',
                    style: headLineStyle.headlineMedium,
                  ),
                  1: Text(
                    'Hafs',
                    style: headLineStyle.headlineMedium,
                  ),
                  2: Text(
                    'Sch',
                    style: headLineStyle.headlineMedium,
                  ),
                },
                groupValue: settingsState.getArabicFontIndex,
                onValueChanged: (int? index) {
                  settingsState.changeArabicFontIndex = index!;
                },
              ),
              const SizedBox(height: 16),
              Text(
                locale.textFont,
                style: headLineStyle.headlineMedium,
              ),
              const SizedBox(height: 8),
              CupertinoSlidingSegmentedControl(
                thumbColor: appTheme.colorScheme.titleColor.withOpacity(0.25),
                padding: const EdgeInsets.all(4),
                children: <int, Widget>{
                  0: Text(
                    'Montserrat',
                    style: headLineStyle.headlineMedium,
                  ),
                  1: Text(
                    'Gilroy',
                    style: headLineStyle.headlineMedium,
                  ),
                  2: Text(
                    'Nexa',
                    style: headLineStyle.headlineMedium,
                  ),
                },
                groupValue: settingsState.getFontIndex,
                onValueChanged: (int? index) {
                  settingsState.changeFontIndex = index!;
                },
              ),
              const SizedBox(height: 16),
              Text(
                locale.arabicAlignText,
                style: headLineStyle.headlineMedium,
              ),
              const SizedBox(height: 8),
              CupertinoSlidingSegmentedControl(
                thumbColor: appTheme.colorScheme.titleColor.withOpacity(0.25),
                padding: const EdgeInsets.all(4),
                children: const <int, Widget>{
                  0: Icon(CupertinoIcons.text_alignleft),
                  1: Icon(CupertinoIcons.text_aligncenter),
                  2: Icon(CupertinoIcons.text_alignright),
                  3: Icon(CupertinoIcons.text_justify),
                },
                groupValue: settingsState.getTextArabicAlignIndex,
                onValueChanged: (int? index) {
                  settingsState.changeArabicTextAlignIndex = index!;
                },
              ),
              const SizedBox(height: 16),
              Text(
                locale.alignText,
                style: headLineStyle.headlineMedium,
              ),
              const SizedBox(height: 8),
              CupertinoSlidingSegmentedControl(
                thumbColor: appTheme.colorScheme.titleColor.withOpacity(0.25),
                padding: const EdgeInsets.all(4),
                children: const <int, Widget>{
                  0: Icon(CupertinoIcons.text_alignleft),
                  1: Icon(CupertinoIcons.text_aligncenter),
                  2: Icon(CupertinoIcons.text_alignright),
                  3: Icon(CupertinoIcons.text_justify),
                },
                groupValue: settingsState.getTextAlignIndex,
                onValueChanged: (int? index) {
                  settingsState.changeTextAlignIndex = index!;
                },
              ),
              const SizedBox(height: 16),
              Text(
                locale.arabicTextSize,
                style: headLineStyle.headlineMedium,
              ),
              Slider(
                value: settingsState.getArabicTextSize,
                min: 14,
                max: 100,
                divisions: 100,
                label: settingsState.getArabicTextSize.round().toString(),
                onChanged: (double? size) {
                  settingsState.changeArabicTextSize = size!;
                },
              ),
              Text(
                locale.textSize,
                style: headLineStyle.headlineMedium,
              ),
              Slider(
                value: settingsState.getTextSize,
                min: 14,
                max: 100,
                divisions: 100,
                label: settingsState.getTextSize.round().toString(),
                onChanged: (double? size) {
                  settingsState.changeTextSize = size!;
                },
              ),
              Card(
                shape: AppStyles.mainShape,
                child: ListTile(
                  shape: AppStyles.mainShape,
                  contentPadding: AppStyles.mainMardingMini,
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  title: Text(
                    locale.arabicTextColor,
                    style: headLineStyle.headlineMedium,
                  ),
                  leading: Icon(
                    Icons.palette_outlined,
                    color: appTheme.brightness == Brightness.dark
                        ? settingsState.getArabicDarkTextColor
                        : settingsState.getArabicLightTextColor,
                  ),
                  trailing: Card(
                    shape: AppStyles.mainShape,
                    color: appTheme.colorScheme.titleColor.withOpacity(0.50),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    locale.forLightTheme,
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: AppStyles.mainShape,
                                  content: Material(
                                    color: Colors.transparent,
                                    child: MaterialColorPicker(
                                      onlyShadeSelection: true,
                                      onColorChange: (Color color) {
                                        settingsState.changeArabicLightColor =
                                            color;
                                      },
                                      selectedColor:
                                          settingsState.getArabicLightTextColor,
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      shape: AppStyles.mainShape,
                                      child: Text(
                                        locale.close,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  settingsState.getArabicLightTextColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    locale.forDarkTheme,
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: AppStyles.mainShape,
                                  content: Material(
                                    color: Colors.transparent,
                                    child: MaterialColorPicker(
                                      onlyShadeSelection: true,
                                      onColorChange: (Color color) {
                                        settingsState.changeArabicDarkColor =
                                            color;
                                      },
                                      selectedColor:
                                          settingsState.getArabicDarkTextColor,
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      shape: AppStyles.mainShape,
                                      child: Text(
                                        locale.close,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  settingsState.getArabicDarkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                shape: AppStyles.mainShape,
                child: ListTile(
                  shape: AppStyles.mainShape,
                  contentPadding: AppStyles.mainMardingMini,
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  title: Text(
                    locale.textColor,
                    style: headLineStyle.headlineMedium,
                  ),
                  leading: Icon(
                    Icons.palette_outlined,
                    color: appTheme.brightness == Brightness.dark
                        ? settingsState.getDarkTextColor
                        : settingsState.getLightTextColor,
                  ),
                  trailing: Card(
                    shape: AppStyles.mainShape,
                    color: appTheme.colorScheme.titleColor.withOpacity(0.50),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    locale.forLightTheme,
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: AppStyles.mainShape,
                                  content: Material(
                                    color: Colors.transparent,
                                    child: MaterialColorPicker(
                                      onlyShadeSelection: true,
                                      onColorChange: (Color color) {
                                        settingsState.changeLightColor = color;
                                      },
                                      selectedColor:
                                          settingsState.getLightTextColor,
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      shape: AppStyles.mainShape,
                                      child: Text(
                                        locale.close,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: settingsState.getLightTextColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    locale.forDarkTheme,
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: AppStyles.mainShape,
                                  content: Material(
                                    color: Colors.transparent,
                                    child: MaterialColorPicker(
                                      onlyShadeSelection: true,
                                      onColorChange: (Color color) {
                                        settingsState.changeDarkColor = color;
                                      },
                                      selectedColor:
                                          settingsState.getDarkTextColor,
                                    ),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      shape: AppStyles.mainShape,
                                      child: Text(
                                        locale.close,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: settingsState.getDarkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SwitchListTile(
                value: settingsState.getAdaptiveTheme,
                onChanged: (bool? onChanged) {
                  settingsState.changeAdaptiveTheme = onChanged!;
                },
                contentPadding: AppStyles.mainMardingMiniHorizontalMini,
                title: Text(
                  locale.adaptiveTheme,
                  style: headLineStyle.headlineMedium,
                ),
              ),
              SwitchListTile(
                value: settingsState.getDarkTheme,
                onChanged: settingsState.getAdaptiveTheme
                    ? null
                    : (bool? onChanged) {
                        settingsState.changeDarkTheme = onChanged!;
                      },
                contentPadding: AppStyles.mainMardingMiniHorizontalMini,
                title: Text(
                  locale.darkTheme,
                  style: headLineStyle.headlineMedium,
                ),
              ),
              SwitchListTile(
                value: settingsState.getWakeLock,
                onChanged: (bool? onChanged) {
                  settingsState.changeWakeLock = onChanged!;
                },
                contentPadding: AppStyles.mainMardingMiniHorizontalMini,
                title: Text(
                  locale.displayAlways,
                  style: headLineStyle.headlineMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
