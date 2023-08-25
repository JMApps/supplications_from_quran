import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supplications_from_quran/domain/models/supplication_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String dbName = 'supplications_ru.db';

    String path = join(documentDirectory!.path, dbName);
    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle.load(join('assets/databases', dbName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path);
  }

  Future<List<SupplicationModel>> getAllSupplications() async {
    final Database dbClient = await db;
    var res = await dbClient.query('Table_of_supplications');
    List<SupplicationModel>? allSupplications = res.isNotEmpty ? res.map((c) => SupplicationModel.fromMap(c)).toList() : null;
    return allSupplications!;
  }

  Future<List<SupplicationModel>> getFavoriteSupplications() async {
    final Database dbClient = await db;
    var res = await dbClient.query('Table_of_supplications', where: 'favorite_state == 1');
    List<SupplicationModel>? allSupplications = res.isNotEmpty ? res.map((c) => SupplicationModel.fromMap(c)).toList() : null;
    return allSupplications!;
  }

  Future<void> addRemoveFavorite({required int supplicationId}) async {
    final Database dbClient = await db;
    var currentData = await dbClient.query(
      'Table_of_supplications',
      where: 'id = ?',
      whereArgs: [supplicationId],
    );

    if (currentData.isNotEmpty) {
      int currentFavoriteState = currentData.first['favorite_state'] as int;
      int newFavoriteState = (currentFavoriteState == 0) ? 1 : 0;
      await dbClient.update(
        'Table_of_supplications',
        {
          'favorite_state': newFavoriteState,
        },
        where: 'id = ?',
        whereArgs: [supplicationId],
      );
    }
  }
}
