import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'test_data_base_name',
      'chinook.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<PlayListRow>> playList() => performPlayList(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future delPlaiList({
    int? id,
  }) =>
      performDelPlaiList(
        _database,
        id: id,
      );

  Future insertPlaylist({
    int? id,
    String? name,
  }) =>
      performInsertPlaylist(
        _database,
        id: id,
        name: name,
      );

  /// END UPDATE QUERY CALLS
}
