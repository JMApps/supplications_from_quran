import 'package:supplications_from_quran/domain/models/supplication_model.dart';
import 'package:supplications_from_quran/domain/repositories/supplications_perository.dart';

class SupplicationInteractor {
  final SupplicationRepository _supplicationRepository = SupplicationRepository();

  Future<List<SupplicationModel>> getAllSupplications() async {
    return await _supplicationRepository.fetchSupplications();
  }

  Future<List<SupplicationModel>> getFavoriteSupplications() async {
    return await _supplicationRepository.fetchFavoriteSupplications();
  }

  Future<void> addRemoveFavorite({required int supplicationId}) async {
    return await _supplicationRepository.addRemoveFavorite(supplicationId: supplicationId);
  }
}
