import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'booking_list_record.g.dart';

abstract class BookingListRecord
    implements Built<BookingListRecord, BookingListRecordBuilder> {
  static Serializer<BookingListRecord> get serializer =>
      _$bookingListRecordSerializer;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  @BuiltValueField(wireName: 'create_by')
  DocumentReference? get createBy;

  @BuiltValueField(wireName: 'update_date')
  DateTime? get updateDate;

  @BuiltValueField(wireName: 'update_by')
  DocumentReference? get updateBy;

  @BuiltValueField(wireName: 'delete_date')
  DateTime? get deleteDate;

  @BuiltValueField(wireName: 'delete_by')
  DocumentReference? get deleteBy;

  int? get status;

  String? get subject;

  String? get detail;

  int? get price;

  LatLng? get location;

  BuiltList<String>? get photo;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BookingListRecordBuilder builder) => builder
    ..status = 0
    ..subject = ''
    ..detail = ''
    ..price = 0
    ..photo = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking_list');

  static Stream<BookingListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BookingListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BookingListRecord._();
  factory BookingListRecord([void Function(BookingListRecordBuilder) updates]) =
      _$BookingListRecord;

  static BookingListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBookingListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  DateTime? deleteDate,
  DocumentReference? deleteBy,
  int? status,
  String? subject,
  String? detail,
  int? price,
  LatLng? location,
}) {
  final firestoreData = serializers.toFirestore(
    BookingListRecord.serializer,
    BookingListRecord(
      (b) => b
        ..createDate = createDate
        ..createBy = createBy
        ..updateDate = updateDate
        ..updateBy = updateBy
        ..deleteDate = deleteDate
        ..deleteBy = deleteBy
        ..status = status
        ..subject = subject
        ..detail = detail
        ..price = price
        ..location = location
        ..photo = null,
    ),
  );

  return firestoreData;
}
