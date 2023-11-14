import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRoomListRecord extends FirestoreRecord {
  ChatRoomListRecord._(
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

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "partner" field.
  DocumentReference? _partner;
  DocumentReference? get partner => _partner;
  bool hasPartner() => _partner != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _updateDate = snapshotData['update_date'] as DateTime?;
    _partner = snapshotData['partner'] as DocumentReference?;
    _lastMessage = snapshotData['last_message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_room_list');

  static Stream<ChatRoomListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRoomListRecord.fromSnapshot(s));

  static Future<ChatRoomListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRoomListRecord.fromSnapshot(s));

  static ChatRoomListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatRoomListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRoomListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRoomListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRoomListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRoomListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRoomListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  DateTime? updateDate,
  DocumentReference? partner,
  String? lastMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'update_date': updateDate,
      'partner': partner,
      'last_message': lastMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRoomListRecordDocumentEquality
    implements Equality<ChatRoomListRecord> {
  const ChatRoomListRecordDocumentEquality();

  @override
  bool equals(ChatRoomListRecord? e1, ChatRoomListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.updateDate == e2?.updateDate &&
        e1?.partner == e2?.partner &&
        e1?.lastMessage == e2?.lastMessage;
  }

  @override
  int hash(ChatRoomListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.updateDate,
        e?.partner,
        e?.lastMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRoomListRecord;
}
