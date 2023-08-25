import 'package:supplications_from_quran/data/services/database_helper.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';

class SupplicationRepository {
  final DatabaseHelper _databaseHelper;

  SupplicationRepository() : _databaseHelper = DatabaseHelper();

  Future<List<SupplicationModel>> fetchSupplications() async {
    return await _databaseHelper.getAllSupplications();
  }

  Future<List<SupplicationModel>> fetchFavoriteSupplications() async {
    return await _databaseHelper.getFavoriteSupplications();
  }

  Future<void> addRemoveFavorite({required int supplicationId}) async {
    return await _databaseHelper.addRemoveFavorite(supplicationId: supplicationId);
  }
}
