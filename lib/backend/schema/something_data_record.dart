import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SomethingDataRecord extends FirestoreRecord {
  SomethingDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "listData" field.
  List<String>? _listData;
  List<String> get listData => _listData ?? const [];
  bool hasListData() => _listData != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _listData = getDataList(snapshotData['listData']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('something_data');

  static Stream<SomethingDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SomethingDataRecord.fromSnapshot(s));

  static Future<SomethingDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SomethingDataRecord.fromSnapshot(s));

  static SomethingDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SomethingDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SomethingDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SomethingDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SomethingDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SomethingDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSomethingDataRecordData({
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class SomethingDataRecordDocumentEquality
    implements Equality<SomethingDataRecord> {
  const SomethingDataRecordDocumentEquality();

  @override
  bool equals(SomethingDataRecord? e1, SomethingDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.text == e2?.text &&
        listEquality.equals(e1?.listData, e2?.listData);
  }

  @override
  int hash(SomethingDataRecord? e) =>
      const ListEquality().hash([e?.text, e?.listData]);

  @override
  bool isValidKey(Object? o) => o is SomethingDataRecord;
}
