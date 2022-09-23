

import 'package:supplications_from_quran/data/local/database/model/main_list_item_model.dart';
import 'package:supplications_from_quran/data/local/database/service/database_service.dart';

class DatabaseQuery {
  DatabaseService con = DatabaseService();

  Future<List<MainListItemModel>> getAllAyahs() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_ayahs');
    List<MainListItemModel>? allAyahs = res.isNotEmpty ? res.map((c) => MainListItemModel.fromMap(c)).toList() : null;
    return allAyahs!;
  }
}