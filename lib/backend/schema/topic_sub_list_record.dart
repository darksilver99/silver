import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'topic_sub_list_record.g.dart';

abstract class TopicSubListRecord
    implements Built<TopicSubListRecord, TopicSubListRecordBuilder> {
  static Serializer<TopicSubListRecord> get serializer =>
      _$topicSubListRecordSerializer;

  int? get status;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  @BuiltValueField(wireName: 'create_by')
  DocumentReference? get createBy;

  @BuiltValueField(wireName: 'update_date')
  DateTime? get updateDate;

  @BuiltValueField(wireName: 'update_by')
  DocumentReference? get updateBy;

  String? get subject;

  String? get detail;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(TopicSubListRecordBuilder builder) => builder
    ..status = 0
    ..subject = ''
    ..detail = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('topic_sub_list')
          : FirebaseFirestore.instance.collectionGroup('topic_sub_list');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('topic_sub_list').doc();

  static Stream<TopicSubListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TopicSubListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TopicSubListRecord._();
  factory TopicSubListRecord(
          [void Function(TopicSubListRecordBuilder) updates]) =
      _$TopicSubListRecord;

  static TopicSubListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    TopicSubListRecord.serializer,
    TopicSubListRecord(
      (t) => t
        ..status = status
        ..createDate = createDate
        ..createBy = createBy
        ..updateDate = updateDate
        ..updateBy = updateBy
        ..subject = subject
        ..detail = detail,
    ),
  );

  return firestoreData;
}
