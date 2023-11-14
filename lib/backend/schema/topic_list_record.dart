import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicListRecord extends FirestoreRecord {
  TopicListRecord._(
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

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "hits" field.
  int? _hits;
  int get hits => _hits ?? 0;
  bool hasHits() => _hits != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _hits = castToType<int>(snapshotData['hits']);
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topic_list');

  static Stream<TopicListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicListRecord.fromSnapshot(s));

  static Future<TopicListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicListRecord.fromSnapshot(s));

  static TopicListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TopicListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  String? subject,
  String? detail,
  int? hits,
  DateTime? updateDate,
  DocumentReference? updateBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'subject': subject,
      'detail': detail,
      'hits': hits,
      'update_date': updateDate,
      'update_by': updateBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicListRecordDocumentEquality implements Equality<TopicListRecord> {
  const TopicListRecordDocumentEquality();

  @override
  bool equals(TopicListRecord? e1, TopicListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        e1?.hits == e2?.hits &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy;
  }

  @override
  int hash(TopicListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.subject,
        e?.detail,
        e?.hits,
        e?.updateDate,
        e?.updateBy
      ]);

  @override
  bool isValidKey(Object? o) => o is TopicListRecord;
}
