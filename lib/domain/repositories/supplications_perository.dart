import 'package:supplications_from_quran/data/services/database_helper.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';

class SupplicationRepository {
  final DatabaseHelper _databaseHelper;

  SupplicationRepository() : _databaseHelper = DatabaseHelper();

  Future<List<SupplicationModel>> fetchSupplications({required String tableName}) async {
    return await _databaseHelper.getAllSupplications(tableName: tableName);
  }

  Future<List<SupplicationModel>> fetchFavoriteSupplications({required String tableName}) async {
    return await _databaseHelper.getFavoriteSupplications(tableName: tableName);
  }

  Future<void> addRemoveFavorite({required String tableName, required int supplicationId}) async {
    return await _databaseHelper.addRemoveFavorite(tableName: tableName, supplicationId: supplicationId);
  }
}
