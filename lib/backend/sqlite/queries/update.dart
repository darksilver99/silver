import 'package:sqflite/sqflite.dart';

/// BEGIN DELPLAILIST
Future performDelPlaiList(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE  FROM playlists WHERE  PlaylistId = ${id}
''';
  return database.rawQuery(query);
}

/// END DELPLAILIST

/// BEGIN INSERTPLAYLIST
Future performInsertPlaylist(
  Database database, {
  int? id,
  String? name,
}) {
  final query = '''
INSERT INTO playlists (PlaylistId, Name) VALUES (${id}, ${name})
''';
  return database.rawQuery(query);
}

/// END INSERTPLAYLIST
