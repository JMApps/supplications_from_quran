import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';
import 'package:supplications_from_quran/provider/app_settings_state.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          margin: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            child: Material(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Размер текста аята',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: CupertinoSlider(
                            activeColor: Colors.blue,
                            min: 14,
                            max: 40,
                            value: context.watch<AppSettingsState>().getTextArabicSize,
                            onChanged: (value) {
                              context.read<AppSettingsState>().updateArabicTextSizeValue(value);
                            },
                            onChangeEnd: (value) {
                              context.read<AppSettingsState>().saveArabicTextSizeValue(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: Text(
                            '${context.watch<AppSettingsState>().getTextArabicSize.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Размер текста перевода',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: CupertinoSlider(
                            activeColor: Colors.blue,
                            min: 14,
                            max: 40,
                            value: context.watch<AppSettingsState>().getTextTranslationSize,
                            onChanged: (value) {
                              context.read<AppSettingsState>().updateTranslationTextSizeValue(value);
                            },
                            onChangeEnd: (value) {
                              context.read<AppSettingsState>().saveTranslationTextSizeValue(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: Text(
                            '${context.watch<AppSettingsState>().getTextTranslationSize.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: context.watch<AppSettingsState>().getArabicTextColor,
                      ),
                      title: const Text(
                        'Цвет текста аята',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: context.watch<AppSettingsState>().getArabicTextColor,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: context.watch<AppSettingsState>().getArabicTextColor,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    context.read<AppSettingsState>().updateTextArabicColor(color);
                                    context.read<AppSettingsState>().saveTextArabicColor(color);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: context.watch<AppSettingsState>().getTranslationColor,
                      ),
                      title: const Text(
                        'Цвет текста перевода',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: context.watch<AppSettingsState>().getTranslationColor,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: context.watch<AppSettingsState>().getTranslationColor,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    context.read<AppSettingsState>().updateTextTranslationColor(color);
                                    context.read<AppSettingsState>().saveTextTranslationColor(color);
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
            ),
          ),
        ),
      ],
    );
  }
}