import 'package:supplications_from_quran/data/local/database/model/main_list_item_model.dart';
import 'package:supplications_from_quran/data/local/database/service/database_service.dart';

class DatabaseQuery {

  DatabaseService con = DatabaseService();

  Future<List<MainListItemModel>> getAllAyahs() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_ayahs');
    List<MainListItemModel>? allAyahs = res.isNotEmpty
        ? res.map((c) => MainListItemModel.fromMap(c)).toList()
        : null;
    return allAyahs!;
  }

  Future<List<MainListItemModel>> getFavoriteAyahs() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_ayahs', where: 'favorite_state == 1');
    List<MainListItemModel>? allAyahs = res.isNotEmpty
        ? res.map((c) => MainListItemModel.fromMap(c)).toList()
        : null;
    return allAyahs!;
  }

  addRemoveFavoriteChapter(int state, int itemId) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_ayahs SET favorite_state = $state WHERE _id == $itemId');
  }
}
