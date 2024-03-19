import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN PLAYLIST
Future<List<PlayListRow>> performPlayList(
  Database database,
) {
  final query = '''
SELECT * FROM playlists
''';
  return _readQuery(database, query, (d) => PlayListRow(d));
}

class PlayListRow extends SqliteRow {
  PlayListRow(Map<String, dynamic> data) : super(data);

  String? get name => data['Name'] as String?;
}

/// END PLAYLIST
