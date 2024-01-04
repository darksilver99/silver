// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestTypeStruct extends FFFirebaseStruct {
  TestTypeStruct({
    int? id,
    String? title,
    List<String>? images,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _images = images,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;
  void updateImages(Function(List<String>) updateFn) =>
      updateFn(_images ??= []);
  bool hasImages() => _images != null;

  static TestTypeStruct fromMap(Map<String, dynamic> data) => TestTypeStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        images: getDataList(data['images']),
      );

  static TestTypeStruct? maybeFromMap(dynamic data) =>
      data is Map ? TestTypeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static TestTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
      );

  static TestTypeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TestTypeStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        images: convertAlgoliaParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TestTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TestTypeStruct &&
        id == other.id &&
        title == other.title &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode => const ListEquality().hash([id, title, images]);
}

TestTypeStruct createTestTypeStruct({
  int? id,
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestTypeStruct(
      id: id,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestTypeStruct? updateTestTypeStruct(
  TestTypeStruct? testType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    testType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestTypeStructData(
  Map<String, dynamic> firestoreData,
  TestTypeStruct? testType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (testType == null) {
    return;
  }
  if (testType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && testType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testTypeData = getTestTypeFirestoreData(testType, forFieldValue);
  final nestedData = testTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = testType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestTypeFirestoreData(
  TestTypeStruct? testType, [
  bool forFieldValue = false,
]) {
  if (testType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(testType.toMap());

  // Add any Firestore field values
  testType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestTypeListFirestoreData(
  List<TestTypeStruct>? testTypes,
) =>
    testTypes?.map((e) => getTestTypeFirestoreData(e, true)).toList() ?? [];
