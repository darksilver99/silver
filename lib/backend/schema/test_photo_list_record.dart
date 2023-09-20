import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestPhotoListRecord extends FirestoreRecord {
  TestPhotoListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _detail = snapshotData['detail'] as String?;
    _image = snapshotData['image'] as String?;
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test_photo_list');

  static Stream<TestPhotoListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestPhotoListRecord.fromSnapshot(s));

  static Future<TestPhotoListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestPhotoListRecord.fromSnapshot(s));

  static TestPhotoListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestPhotoListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestPhotoListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestPhotoListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestPhotoListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestPhotoListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestPhotoListRecordData({
  String? title,
  String? detail,
  String? image,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'detail': detail,
      'image': image,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestPhotoListRecordDocumentEquality
    implements Equality<TestPhotoListRecord> {
  const TestPhotoListRecordDocumentEquality();

  @override
  bool equals(TestPhotoListRecord? e1, TestPhotoListRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.detail == e2?.detail &&
        e1?.image == e2?.image &&
        e1?.order == e2?.order;
  }

  @override
  int hash(TestPhotoListRecord? e) =>
      const ListEquality().hash([e?.title, e?.detail, e?.image, e?.order]);

  @override
  bool isValidKey(Object? o) => o is TestPhotoListRecord;
}
