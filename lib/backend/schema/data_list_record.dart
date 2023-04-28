import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_list_record.g.dart';

abstract class DataListRecord
    implements Built<DataListRecord, DataListRecordBuilder> {
  static Serializer<DataListRecord> get serializer =>
      _$dataListRecordSerializer;

  String? get name;

  String? get detail;

  String? get searchText;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DataListRecordBuilder builder) => builder
    ..name = ''
    ..detail = ''
    ..searchText = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_list');

  static Stream<DataListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DataListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static DataListRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      DataListRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..detail = snapshot.data['detail']
          ..searchText = snapshot.data['searchText']
          ..ffRef = DataListRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<DataListRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'data_list',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  DataListRecord._();
  factory DataListRecord([void Function(DataListRecordBuilder) updates]) =
      _$DataListRecord;

  static DataListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDataListRecordData({
  String? name,
  String? detail,
  String? searchText,
}) {
  final firestoreData = serializers.toFirestore(
    DataListRecord.serializer,
    DataListRecord(
      (d) => d
        ..name = name
        ..detail = detail
        ..searchText = searchText,
    ),
  );

  return firestoreData;
}
