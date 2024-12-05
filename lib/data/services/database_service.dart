import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService.internal();

  factory DatabaseService() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  DatabaseService.internal();

  Future<Database> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, DBValues.dbName);

    var database = await openDatabase(path);

    if (await database.getVersion() < DBValues.dbVersion) {
      database.close();
      await deleteDatabase(path);

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join('assets/databases', DBValues.dbName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);

      database = await openDatabase(path);
      database.setVersion(DBValues.dbVersion);
    }

    return database;
  }
}
