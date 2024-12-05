import '../entities/supplication_entity.dart';

abstract class SupplicationRepository {
  Future<List<SupplicationEntity>> getAllSupplications({required String tableName});

  Future<List<SupplicationEntity>> getFavoriteSupplications({required String tableName, required List<int> favoriteIds});
}
