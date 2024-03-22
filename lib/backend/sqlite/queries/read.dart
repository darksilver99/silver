import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETUSERLIST
Future<List<GetUserListRow>> performGetUserList(
  Database database,
) {
  final query = '''
SELECT * FROM users ORDER BY displayName ASC
''';
  return _readQuery(database, query, (d) => GetUserListRow(d));
}

class GetUserListRow extends SqliteRow {
  GetUserListRow(Map<String, dynamic> data) : super(data);

  int? get id => data['id'] as int?;
  String? get displayName => data['displayName'] as String?;
}

/// END GETUSERLIST
