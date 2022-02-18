class AyahItem {
  final int id;
  final String contentAyah;
  final String contentTranslation;
  final String contentTranslationShare;
  final String nameAudio;
  final String nameDua;
  final int favoriteState;

  AyahItem.fromMap(dynamic obj)
      : id = obj['_id'],
        contentAyah = obj['content_ayah'],
        contentTranslation = obj['content_translation'],
        contentTranslationShare = obj['content_translation_share'],
        nameAudio = obj['name_audio'],
        nameDua = obj['name_dua'],
        favoriteState = obj['favorite_state'];
}
