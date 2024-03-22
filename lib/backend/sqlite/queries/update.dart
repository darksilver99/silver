import 'package:sqflite/sqflite.dart';

/// BEGIN INSERTUSERNAME
Future performInsertUserName(
  Database database, {
  String? name,
}) {
  final query = '''
INSERT INTO users  (displayName) VALUES ('${name}')
''';
  return database.rawQuery(query);
}

/// END INSERTUSERNAME

/// BEGIN DELETEUSER
Future performDeleteUser(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM users WHERE id = ${id};
''';
  return database.rawQuery(query);
}

/// END DELETEUSER
