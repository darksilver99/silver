import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicSubListRecord extends FirestoreRecord {
  TopicSubListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = castToType<int>(snapshotData['status']);
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('topic_sub_list')
          : FirebaseFirestore.instance.collectionGroup('topic_sub_list');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('topic_sub_list').doc();

  static Stream<TopicSubListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicSubListRecord.fromSnapshot(s));

  static Future<TopicSubListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicSubListRecord.fromSnapshot(s));

  static TopicSubListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TopicSubListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicSubListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicSubListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicSubListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicSubListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicSubListRecordData({
  int? status,
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  String? subject,
  String? detail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'subject': subject,
      'detail': detail,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicSubListRecordDocumentEquality
    implements Equality<TopicSubListRecord> {
  const TopicSubListRecordDocumentEquality();

  @override
  bool equals(TopicSubListRecord? e1, TopicSubListRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail;
  }

  @override
  int hash(TopicSubListRecord? e) => const ListEquality().hash([
        e?.status,
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.subject,
        e?.detail
      ]);

  @override
  bool isValidKey(Object? o) => o is TopicSubListRecord;
}
