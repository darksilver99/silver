// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingListRecord> _$bookingListRecordSerializer =
    new _$BookingListRecordSerializer();

class _$BookingListRecordSerializer
    implements StructuredSerializer<BookingListRecord> {
  @override
  final Iterable<Type> types = const [BookingListRecord, _$BookingListRecord];
  @override
  final String wireName = 'BookingListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookingListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createBy;
    if (value != null) {
      result
        ..add('create_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.updateDate;
    if (value != null) {
      result
        ..add('update_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updateBy;
    if (value != null) {
      result
        ..add('update_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.deleteDate;
    if (value != null) {
      result
        ..add('delete_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.deleteBy;
    if (value != null) {
      result
        ..add('delete_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.subject;
    if (value != null) {
      result
        ..add('subject')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  BookingListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'create_by':
          result.createBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'update_date':
          result.updateDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'update_by':
          result.updateBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'delete_date':
          result.deleteDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'delete_by':
          result.deleteBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'subject':
          result.subject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'photo':
          result.photo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$BookingListRecord extends BookingListRecord {
  @override
  final DateTime? createDate;
  @override
  final DocumentReference<Object?>? createBy;
  @override
  final DateTime? updateDate;
  @override
  final DocumentReference<Object?>? updateBy;
  @override
  final DateTime? deleteDate;
  @override
  final DocumentReference<Object?>? deleteBy;
  @override
  final int? status;
  @override
  final String? subject;
  @override
  final String? detail;
  @override
  final int? price;
  @override
  final LatLng? location;
  @override
  final BuiltList<String>? photo;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BookingListRecord(
          [void Function(BookingListRecordBuilder)? updates]) =>
      (new BookingListRecordBuilder()..update(updates))._build();

  _$BookingListRecord._(
      {this.createDate,
      this.createBy,
      this.updateDate,
      this.updateBy,
      this.deleteDate,
      this.deleteBy,
      this.status,
      this.subject,
      this.detail,
      this.price,
      this.location,
      this.photo,
      this.ffRef})
      : super._();

  @override
  BookingListRecord rebuild(void Function(BookingListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingListRecordBuilder toBuilder() =>
      new BookingListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingListRecord &&
        createDate == other.createDate &&
        createBy == other.createBy &&
        updateDate == other.updateDate &&
        updateBy == other.updateBy &&
        deleteDate == other.deleteDate &&
        deleteBy == other.deleteBy &&
        status == other.status &&
        subject == other.subject &&
        detail == other.detail &&
        price == other.price &&
        location == other.location &&
        photo == other.photo &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, createBy.hashCode);
    _$hash = $jc(_$hash, updateDate.hashCode);
    _$hash = $jc(_$hash, updateBy.hashCode);
    _$hash = $jc(_$hash, deleteDate.hashCode);
    _$hash = $jc(_$hash, deleteBy.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, photo.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookingListRecord')
          ..add('createDate', createDate)
          ..add('createBy', createBy)
          ..add('updateDate', updateDate)
          ..add('updateBy', updateBy)
          ..add('deleteDate', deleteDate)
          ..add('deleteBy', deleteBy)
          ..add('status', status)
          ..add('subject', subject)
          ..add('detail', detail)
          ..add('price', price)
          ..add('location', location)
          ..add('photo', photo)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BookingListRecordBuilder
    implements Builder<BookingListRecord, BookingListRecordBuilder> {
  _$BookingListRecord? _$v;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  DocumentReference<Object?>? _createBy;
  DocumentReference<Object?>? get createBy => _$this._createBy;
  set createBy(DocumentReference<Object?>? createBy) =>
      _$this._createBy = createBy;

  DateTime? _updateDate;
  DateTime? get updateDate => _$this._updateDate;
  set updateDate(DateTime? updateDate) => _$this._updateDate = updateDate;

  DocumentReference<Object?>? _updateBy;
  DocumentReference<Object?>? get updateBy => _$this._updateBy;
  set updateBy(DocumentReference<Object?>? updateBy) =>
      _$this._updateBy = updateBy;

  DateTime? _deleteDate;
  DateTime? get deleteDate => _$this._deleteDate;
  set deleteDate(DateTime? deleteDate) => _$this._deleteDate = deleteDate;

  DocumentReference<Object?>? _deleteBy;
  DocumentReference<Object?>? get deleteBy => _$this._deleteBy;
  set deleteBy(DocumentReference<Object?>? deleteBy) =>
      _$this._deleteBy = deleteBy;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(String? detail) => _$this._detail = detail;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  ListBuilder<String>? _photo;
  ListBuilder<String> get photo => _$this._photo ??= new ListBuilder<String>();
  set photo(ListBuilder<String>? photo) => _$this._photo = photo;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BookingListRecordBuilder() {
    BookingListRecord._initializeBuilder(this);
  }

  BookingListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createDate = $v.createDate;
      _createBy = $v.createBy;
      _updateDate = $v.updateDate;
      _updateBy = $v.updateBy;
      _deleteDate = $v.deleteDate;
      _deleteBy = $v.deleteBy;
      _status = $v.status;
      _subject = $v.subject;
      _detail = $v.detail;
      _price = $v.price;
      _location = $v.location;
      _photo = $v.photo?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookingListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingListRecord;
  }

  @override
  void update(void Function(BookingListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookingListRecord build() => _build();

  _$BookingListRecord _build() {
    _$BookingListRecord _$result;
    try {
      _$result = _$v ??
          new _$BookingListRecord._(
              createDate: createDate,
              createBy: createBy,
              updateDate: updateDate,
              updateBy: updateBy,
              deleteDate: deleteDate,
              deleteBy: deleteBy,
              status: status,
              subject: subject,
              detail: detail,
              price: price,
              location: location,
              photo: _photo?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'photo';
        _photo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BookingListRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
