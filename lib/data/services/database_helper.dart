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

    String dbName = 'supplications_2.db';

    String path = join(documentDirectory!.path, dbName);
    var exists = await databaseExists(path);

    String toDeleteDB = '${documentDirectory.path}/supplications.db';

    var delDB = await databaseExists(toDeleteDB);

    if (delDB) {
      await deleteDatabase(toDeleteDB);
    }

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

  Future<List<SupplicationModel>> getAllSupplications({required String tableName}) async {
    final Database dbClient = await db;
    var res = await dbClient.query(tableName);
    List<SupplicationModel>? allSupplications = res.isNotEmpty ? res.map((c) => SupplicationModel.fromMap(c)).toList() : null;
    return allSupplications!;
  }

  Future<List<SupplicationModel>> getFavoriteSupplications({required String tableName, required List<int> favorites}) async {
    final Database dbClient = await db;
    var res = await dbClient.query(tableName, where: 'id IN (${favorites.map((id) => '?').join(', ')})', whereArgs: favorites);
    List<SupplicationModel>? allSupplications = res.isNotEmpty ? res.map((c) => SupplicationModel.fromMap(c)).toList() : null;
    return allSupplications!;
  }
}
