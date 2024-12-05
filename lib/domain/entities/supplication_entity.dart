import '../../data/models/supplication_model.dart';

class SupplicationEntity {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;
  final String nameAudio;

  const SupplicationEntity({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
    required this.nameAudio,
  });

  factory SupplicationEntity.fromModel(SupplicationModel model) {
    return SupplicationEntity(
      id: model.id,
      ayahArabic: model.ayahArabic,
      ayahTranslation: model.ayahTranslation,
      ayahSource: model.ayahSource,
      nameAudio: model.nameAudio,
    );
  }
}
