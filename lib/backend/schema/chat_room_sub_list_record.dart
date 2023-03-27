import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_room_sub_list_record.g.dart';

abstract class ChatRoomSubListRecord
    implements Built<ChatRoomSubListRecord, ChatRoomSubListRecordBuilder> {
  static Serializer<ChatRoomSubListRecord> get serializer =>
      _$chatRoomSubListRecordSerializer;

  @BuiltValueField(wireName: 'create_by')
  DocumentReference? get createBy;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  int? get status;

  String? get message;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ChatRoomSubListRecordBuilder builder) =>
      builder
        ..status = 0
        ..message = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_room_sub_list')
          : FirebaseFirestore.instance.collectionGroup('chat_room_sub_list');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chat_room_sub_list').doc();

  static Stream<ChatRoomSubListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatRoomSubListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatRoomSubListRecord._();
  factory ChatRoomSubListRecord(
          [void Function(ChatRoomSubListRecordBuilder) updates]) =
      _$ChatRoomSubListRecord;

  static ChatRoomSubListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatRoomSubListRecordData({
  DocumentReference? createBy,
  DateTime? createDate,
  int? status,
  String? message,
}) {
  final firestoreData = serializers.toFirestore(
    ChatRoomSubListRecord.serializer,
    ChatRoomSubListRecord(
      (c) => c
        ..createBy = createBy
        ..createDate = createDate
        ..status = status
        ..message = message,
    ),
  );

  return firestoreData;
}
