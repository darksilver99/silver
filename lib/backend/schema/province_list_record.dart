import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProvinceListRecord extends FirestoreRecord {
  ProvinceListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "postCode" field.
  String? _postCode;
  String get postCode => _postCode ?? '';
  bool hasPostCode() => _postCode != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _name = snapshotData['name'] as String?;
    _postCode = snapshotData['postCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('province_list');

  static Stream<ProvinceListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProvinceListRecord.fromSnapshot(s));

  static Future<ProvinceListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProvinceListRecord.fromSnapshot(s));

  static ProvinceListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProvinceListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProvinceListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProvinceListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProvinceListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProvinceListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProvinceListRecordData({
  int? id,
  String? name,
  String? postCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'postCode': postCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProvinceListRecordDocumentEquality
    implements Equality<ProvinceListRecord> {
  const ProvinceListRecordDocumentEquality();

  @override
  bool equals(ProvinceListRecord? e1, ProvinceListRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.postCode == e2?.postCode;
  }

  @override
  int hash(ProvinceListRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.postCode]);

  @override
  bool isValidKey(Object? o) => o is ProvinceListRecord;
}
