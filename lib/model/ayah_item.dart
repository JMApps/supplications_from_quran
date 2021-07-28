class AyahItem {
  int? id;
  String? contentAyah;
  String? contentTranslation;
  String? contentTranslationShare;
  String? nameAudio;
  String? nameDua;
  int? favoriteState;

  AyahItem(this.id, this.contentAyah, this.contentTranslation, this.contentTranslationShare, this.nameAudio,
      this.nameDua, this.favoriteState);

  AyahItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.contentAyah = obj['content_ayah'];
    this.contentTranslation = obj['content_translation'];
    this.contentTranslationShare = obj['content_translation_share'];
    this.nameAudio = obj['name_audio'];
    this.nameDua = obj['name_dua'];
    this.favoriteState = obj['favorite_state'];
  }
}