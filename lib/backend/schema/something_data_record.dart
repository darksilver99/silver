import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'something_data_record.g.dart';

abstract class SomethingDataRecord
    implements Built<SomethingDataRecord, SomethingDataRecordBuilder> {
  static Serializer<SomethingDataRecord> get serializer =>
      _$somethingDataRecordSerializer;

  String? get text;

  BuiltList<String>? get listData;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SomethingDataRecordBuilder builder) => builder
    ..text = ''
    ..listData = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('something_data');

  static Stream<SomethingDataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SomethingDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SomethingDataRecord._();
  factory SomethingDataRecord(
          [void Function(SomethingDataRecordBuilder) updates]) =
      _$SomethingDataRecord;

  static SomethingDataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSomethingDataRecordData({
  String? text,
}) {
  final firestoreData = serializers.toFirestore(
    SomethingDataRecord.serializer,
    SomethingDataRecord(
      (s) => s
        ..text = text
        ..listData = null,
    ),
  );

  return firestoreData;
}
