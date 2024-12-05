import '../../core/strings/db_values.dart';

class SupplicationModel {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;
  final String nameAudio;

  const SupplicationModel({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
    required this.nameAudio,
  });

  factory SupplicationModel.fromMap(Map<String, Object?> map) {
    return SupplicationModel(
      id: map[DBValues.dbId] as int,
      ayahArabic: map[DBValues.dbAyahArabic] as String,
      ayahTranslation: map[DBValues.dbAyahTranslation] as String,
      ayahSource: map[DBValues.dbAyahSource] as String,
      nameAudio: map[DBValues.dbNameAudio] as String,
    );
  }
}