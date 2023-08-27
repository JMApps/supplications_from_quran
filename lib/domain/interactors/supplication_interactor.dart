import 'package:supplications_from_quran/domain/models/supplication_model.dart';
import 'package:supplications_from_quran/domain/repositories/supplications_perository.dart';

class SupplicationInteractor {
  final SupplicationRepository _supplicationRepository = SupplicationRepository();

  Future<List<SupplicationModel>> getAllSupplications({required String tableName}) async {
    return await _supplicationRepository.fetchSupplications(tableName: tableName);
  }

  Future<List<SupplicationModel>> getFavoriteSupplications({required String tableName, required List<int> favorites}) async {
    return await _supplicationRepository.fetchFavoriteSupplications(tableName: tableName, favorites:  favorites);
  }

  Future<void> addRemoveFavorite({required String tableName, required int supplicationId}) async {
    return await _supplicationRepository.addRemoveFavorite(tableName: tableName, supplicationId: supplicationId);
  }
}
