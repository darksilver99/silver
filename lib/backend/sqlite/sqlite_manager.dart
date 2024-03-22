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
      'test_silver',
      'bmt4t_db.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetUserListRow>> getUserList() => performGetUserList(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future insertUserName({
    String? name,
  }) =>
      performInsertUserName(
        _database,
        name: name,
      );

  Future deleteUser({
    int? id,
  }) =>
      performDeleteUser(
        _database,
        id: id,
      );

  /// END UPDATE QUERY CALLS
}
