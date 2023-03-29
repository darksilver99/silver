import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'topic_list_record.g.dart';

abstract class TopicListRecord
    implements Built<TopicListRecord, TopicListRecordBuilder> {
  static Serializer<TopicListRecord> get serializer =>
      _$topicListRecordSerializer;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  @BuiltValueField(wireName: 'create_by')
  DocumentReference? get createBy;

  int? get status;

  String? get subject;

  String? get detail;

  int? get hits;

  @BuiltValueField(wireName: 'update_date')
  DateTime? get updateDate;

  @BuiltValueField(wireName: 'update_by')
  DocumentReference? get updateBy;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TopicListRecordBuilder builder) => builder
    ..status = 0
    ..subject = ''
    ..detail = ''
    ..hits = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topic_list');

  static Stream<TopicListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TopicListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TopicListRecord._();
  factory TopicListRecord([void Function(TopicListRecordBuilder) updates]) =
      _$TopicListRecord;

  static TopicListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    TopicListRecord.serializer,
    TopicListRecord(
      (t) => t
        ..createDate = createDate
        ..createBy = createBy
        ..status = status
        ..subject = subject
        ..detail = detail
        ..hits = hits
        ..updateDate = updateDate
        ..updateBy = updateBy,
    ),
  );

  return firestoreData;
}
