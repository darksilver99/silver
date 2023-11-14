import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRoomSubListRecord extends FirestoreRecord {
  ChatRoomSubListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _message = snapshotData['message'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_room_sub_list')
          : FirebaseFirestore.instance.collectionGroup('chat_room_sub_list');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chat_room_sub_list').doc();

  static Stream<ChatRoomSubListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRoomSubListRecord.fromSnapshot(s));

  static Future<ChatRoomSubListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRoomSubListRecord.fromSnapshot(s));

  static ChatRoomSubListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatRoomSubListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRoomSubListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRoomSubListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRoomSubListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRoomSubListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRoomSubListRecordData({
  DocumentReference? createBy,
  DateTime? createDate,
  int? status,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_by': createBy,
      'create_date': createDate,
      'status': status,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRoomSubListRecordDocumentEquality
    implements Equality<ChatRoomSubListRecord> {
  const ChatRoomSubListRecordDocumentEquality();

  @override
  bool equals(ChatRoomSubListRecord? e1, ChatRoomSubListRecord? e2) {
    return e1?.createBy == e2?.createBy &&
        e1?.createDate == e2?.createDate &&
        e1?.status == e2?.status &&
        e1?.message == e2?.message;
  }

  @override
  int hash(ChatRoomSubListRecord? e) => const ListEquality()
      .hash([e?.createBy, e?.createDate, e?.status, e?.message]);

  @override
  bool isValidKey(Object? o) => o is ChatRoomSubListRecord;
}
