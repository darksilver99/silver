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
