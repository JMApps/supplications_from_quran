import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';
import '../../domain/entities/supplication_entity.dart';
import '../../domain/repositories/supplication_repository.dart';
import '../models/supplication_model.dart';
import '../services/database_service.dart';

class SupplicationDataRepository implements SupplicationRepository {
  final DatabaseService _databaseService;

  SupplicationDataRepository(this._databaseService);

  @override
  Future<List<SupplicationEntity>> getAllSupplications({required String tableName}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<SupplicationEntity> allSupplications = resources.isNotEmpty ? resources.map((e) => SupplicationEntity.fromModel(SupplicationModel.fromMap(e))).toList() : [];
    return allSupplications;
  }

  @override
  Future<List<SupplicationEntity>> getFavoriteSupplications({required String tableName, required List<int> favoriteIds}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValues.dbId} IN (${favoriteIds.map((id) => '?').join(', ')})', whereArgs: favoriteIds);
    final List<SupplicationEntity> favoriteSupplications = resources.isNotEmpty ? resources.map((e) => SupplicationEntity.fromModel(SupplicationModel.fromMap(e))).toList() : [];
    return favoriteSupplications;
  }
}