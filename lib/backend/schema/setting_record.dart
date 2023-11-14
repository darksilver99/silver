import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingRecord extends FirestoreRecord {
  SettingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "test_map" field.
  TestTypeStruct? _testMap;
  TestTypeStruct get testMap => _testMap ?? TestTypeStruct();
  bool hasTestMap() => _testMap != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _type = snapshotData['type'] as String?;
    _testMap = TestTypeStruct.maybeFromMap(snapshotData['test_map']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('setting');

  static Stream<SettingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingRecord.fromSnapshot(s));

  static Future<SettingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SettingRecord.fromSnapshot(s));

  static SettingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingRecordData({
  String? text,
  String? type,
  TestTypeStruct? testMap,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'type': type,
      'test_map': TestTypeStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "test_map" field.
  addTestTypeStructData(firestoreData, testMap, 'test_map');

  return firestoreData;
}

class SettingRecordDocumentEquality implements Equality<SettingRecord> {
  const SettingRecordDocumentEquality();

  @override
  bool equals(SettingRecord? e1, SettingRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.type == e2?.type &&
        e1?.testMap == e2?.testMap;
  }

  @override
  int hash(SettingRecord? e) =>
      const ListEquality().hash([e?.text, e?.type, e?.testMap]);

  @override
  bool isValidKey(Object? o) => o is SettingRecord;
}
