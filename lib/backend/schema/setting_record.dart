import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'setting_record.g.dart';

abstract class SettingRecord
    implements Built<SettingRecord, SettingRecordBuilder> {
  static Serializer<SettingRecord> get serializer => _$settingRecordSerializer;

  String? get text;

  String? get type;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SettingRecordBuilder builder) => builder
    ..text = ''
    ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('setting');

  static Stream<SettingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SettingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SettingRecord._();
  factory SettingRecord([void Function(SettingRecordBuilder) updates]) =
      _$SettingRecord;

  static SettingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSettingRecordData({
  String? text,
  String? type,
}) {
  final firestoreData = serializers.toFirestore(
    SettingRecord.serializer,
    SettingRecord(
      (s) => s
        ..text = text
        ..type = type,
    ),
  );

  return firestoreData;
}
