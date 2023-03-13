import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_room_list_record.g.dart';

abstract class ChatRoomListRecord
    implements Built<ChatRoomListRecord, ChatRoomListRecordBuilder> {
  static Serializer<ChatRoomListRecord> get serializer =>
      _$chatRoomListRecordSerializer;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatRoomListRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_room_list');

  static Stream<ChatRoomListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatRoomListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatRoomListRecord._();
  factory ChatRoomListRecord(
          [void Function(ChatRoomListRecordBuilder) updates]) =
      _$ChatRoomListRecord;

  static ChatRoomListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatRoomListRecordData({
  DateTime? createDate,
}) {
  final firestoreData = serializers.toFirestore(
    ChatRoomListRecord.serializer,
    ChatRoomListRecord(
      (c) => c..createDate = createDate,
    ),
  );

  return firestoreData;
}
