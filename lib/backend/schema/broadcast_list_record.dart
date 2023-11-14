import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BroadcastListRecord extends FirestoreRecord {
  BroadcastListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "is_live" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _isLive = snapshotData['is_live'] as bool?;
    _name = snapshotData['name'] as String?;
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('broadcast_list');

  static Stream<BroadcastListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BroadcastListRecord.fromSnapshot(s));

  static Future<BroadcastListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BroadcastListRecord.fromSnapshot(s));

  static BroadcastListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BroadcastListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BroadcastListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BroadcastListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BroadcastListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BroadcastListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBroadcastListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  bool? isLive,
  String? name,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'is_live': isLive,
      'name': name,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class BroadcastListRecordDocumentEquality
    implements Equality<BroadcastListRecord> {
  const BroadcastListRecordDocumentEquality();

  @override
  bool equals(BroadcastListRecord? e1, BroadcastListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.isLive == e2?.isLive &&
        e1?.name == e2?.name &&
        e1?.url == e2?.url;
  }

  @override
  int hash(BroadcastListRecord? e) => const ListEquality()
      .hash([e?.createDate, e?.createBy, e?.isLive, e?.name, e?.url]);

  @override
  bool isValidKey(Object? o) => o is BroadcastListRecord;
}
