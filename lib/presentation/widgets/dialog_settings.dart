import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/until/state/settings_state.dart';

class DialogSettings extends StatelessWidget {
  const DialogSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readSettings = context.read<SettingsState>();
    final watchSettings = context.watch<SettingsState>();
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Размер текста аята',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Slider.adaptive(
                    min: 14,
                    max: 60,
                    value: watchSettings.getTextAyahArabicSize,
                    onChanged: (onChanged) {
                      readSettings.changeTextAyahArabicSize(onChanged);
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Размер текста перевода',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Slider.adaptive(
                    min: 14,
                    max: 60,
                    value: watchSettings.getTextAyahTranslationSize,
                    onChanged: (onChanged) {
                      readSettings.changeTextAyahTranslationSize(onChanged);
                    },
                  ),
                ),
                ListTile(
                  enabled: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Цвет текста аята',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: const Text(
                    'Выберите цвет',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: watchSettings.getTextAyahArabicColor,
                    radius: 15,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            content: BlockPicker(
                              pickerColor: readSettings.getTextAyahArabicColor,
                              onColorChanged: (color) {
                                readSettings.changeTextAyahArabicColor(color);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ListTile(
                  enabled: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Цвет текста перевода',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: const Text(
                    'Выберите цвет',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: watchSettings.getTextAyahTranslationColor,
                    radius: 15,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            content: BlockPicker(
                              pickerColor:
                                  readSettings.getTextAyahTranslationColor,
                              onColorChanged: (color) {
                                readSettings
                                    .changeTextAyahTranslationColor(color);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
