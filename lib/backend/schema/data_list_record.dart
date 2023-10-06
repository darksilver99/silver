import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataListRecord extends FirestoreRecord {
  DataListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "searchText" field.
  String? _searchText;
  String get searchText => _searchText ?? '';
  bool hasSearchText() => _searchText != null;

  // "is_check" field.
  bool? _isCheck;
  bool get isCheck => _isCheck ?? false;
  bool hasIsCheck() => _isCheck != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _detail = snapshotData['detail'] as String?;
    _searchText = snapshotData['searchText'] as String?;
    _isCheck = snapshotData['is_check'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_list');

  static Stream<DataListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DataListRecord.fromSnapshot(s));

  static Future<DataListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DataListRecord.fromSnapshot(s));

  static DataListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DataListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DataListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DataListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DataListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DataListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDataListRecordData({
  String? name,
  String? detail,
  String? searchText,
  bool? isCheck,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'detail': detail,
      'searchText': searchText,
      'is_check': isCheck,
    }.withoutNulls,
  );

  return firestoreData;
}

class DataListRecordDocumentEquality implements Equality<DataListRecord> {
  const DataListRecordDocumentEquality();

  @override
  bool equals(DataListRecord? e1, DataListRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.detail == e2?.detail &&
        e1?.searchText == e2?.searchText &&
        e1?.isCheck == e2?.isCheck;
  }

  @override
  int hash(DataListRecord? e) => const ListEquality()
      .hash([e?.name, e?.detail, e?.searchText, e?.isCheck]);

  @override
  bool isValidKey(Object? o) => o is DataListRecord;
}
