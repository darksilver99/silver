import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'province_list_record.g.dart';

abstract class ProvinceListRecord
    implements Built<ProvinceListRecord, ProvinceListRecordBuilder> {
  static Serializer<ProvinceListRecord> get serializer =>
      _$provinceListRecordSerializer;

  int? get id;

  String? get name;

  String? get postCode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProvinceListRecordBuilder builder) => builder
    ..id = 0
    ..name = ''
    ..postCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('province_list');

  static Stream<ProvinceListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProvinceListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProvinceListRecord._();
  factory ProvinceListRecord(
          [void Function(ProvinceListRecordBuilder) updates]) =
      _$ProvinceListRecord;

  static ProvinceListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProvinceListRecordData({
  int? id,
  String? name,
  String? postCode,
}) {
  final firestoreData = serializers.toFirestore(
    ProvinceListRecord.serializer,
    ProvinceListRecord(
      (p) => p
        ..id = id
        ..name = name
        ..postCode = postCode,
    ),
  );

  return firestoreData;
}
