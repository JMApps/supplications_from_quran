import 'dart:io';

class MainListItemModel {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;
  final String nameAudio;
  final int favoriteState;

  MainListItemModel({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
    required this.nameAudio,
    required this.favoriteState,
  });


  MainListItemModel.fromMap(dynamic object)
      : id = object['_id'],
        ayahArabic = object['ayah_arabic'],
        ayahTranslation = object['ayah_translation_${Platform.localeName.split('_')[0]}'],
        ayahSource = object['ayah_source'],
        nameAudio = object['name_audio'],
        favoriteState = object['favorite_state'];

}
