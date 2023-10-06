import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceListRecord extends FirestoreRecord {
  PlaceListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('place_list');

  static Stream<PlaceListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceListRecord.fromSnapshot(s));

  static Future<PlaceListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaceListRecord.fromSnapshot(s));

  static PlaceListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaceListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceListRecord._(reference, mapFromFirestore(data));

  static PlaceListRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PlaceListRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'create_date': convertAlgoliaParam(
            snapshot.data['create_date'],
            ParamType.DateTime,
            false,
          ),
          'image': snapshot.data['image'],
        },
        PlaceListRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PlaceListRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'place_list',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PlaceListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceListRecordData({
  String? title,
  LatLng? location,
  DateTime? createDate,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'location': location,
      'create_date': createDate,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaceListRecordDocumentEquality implements Equality<PlaceListRecord> {
  const PlaceListRecordDocumentEquality();

  @override
  bool equals(PlaceListRecord? e1, PlaceListRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.location == e2?.location &&
        e1?.createDate == e2?.createDate &&
        e1?.image == e2?.image;
  }

  @override
  int hash(PlaceListRecord? e) => const ListEquality()
      .hash([e?.title, e?.location, e?.createDate, e?.image]);

  @override
  bool isValidKey(Object? o) => o is PlaceListRecord;
}
