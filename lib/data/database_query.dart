import 'package:supplications_from_quran/model/ayah_item.dart';

import 'database_helper.dart';

class DatabaseQuery {

  DatabaseHelper con = DatabaseHelper();

  Future<List<AyahItem>> getAllAyahs() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_ayahs');
    List<AyahItem>? mainAyahs = res.isNotEmpty ? res.map((c) => AyahItem.fromMap(c)).toList() : null;
    return mainAyahs!;
  }

  Future<List<AyahItem>> getFavoriteAyahs() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_ayahs', where: 'favorite_state == 1');
    List<AyahItem>? favoriteAyahs = res.isNotEmpty ? res.map((c) => AyahItem.fromMap(c)).toList() : null;
    return favoriteAyahs!;
  }

  addRemoveFavorite(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_ayahs SET favorite_state = $state WHERE _id == $_id');
  }
}