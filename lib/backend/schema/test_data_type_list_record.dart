import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestDataTypeListRecord extends FirestoreRecord {
  TestDataTypeListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "test_type" field.
  TestTypeStruct? _testType;
  TestTypeStruct get testType => _testType ?? TestTypeStruct();
  bool hasTestType() => _testType != null;

  void _initializeFields() {
    _testType = TestTypeStruct.maybeFromMap(snapshotData['test_type']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test_data_type_list');

  static Stream<TestDataTypeListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestDataTypeListRecord.fromSnapshot(s));

  static Future<TestDataTypeListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TestDataTypeListRecord.fromSnapshot(s));

  static TestDataTypeListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestDataTypeListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestDataTypeListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestDataTypeListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestDataTypeListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestDataTypeListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestDataTypeListRecordData({
  TestTypeStruct? testType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'test_type': TestTypeStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "test_type" field.
  addTestTypeStructData(firestoreData, testType, 'test_type');

  return firestoreData;
}

class TestDataTypeListRecordDocumentEquality
    implements Equality<TestDataTypeListRecord> {
  const TestDataTypeListRecordDocumentEquality();

  @override
  bool equals(TestDataTypeListRecord? e1, TestDataTypeListRecord? e2) {
    return e1?.testType == e2?.testType;
  }

  @override
  int hash(TestDataTypeListRecord? e) =>
      const ListEquality().hash([e?.testType]);

  @override
  bool isValidKey(Object? o) => o is TestDataTypeListRecord;
}
