// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'something_data_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SomethingDataRecord> _$somethingDataRecordSerializer =
    new _$SomethingDataRecordSerializer();

class _$SomethingDataRecordSerializer
    implements StructuredSerializer<SomethingDataRecord> {
  @override
  final Iterable<Type> types = const [
    SomethingDataRecord,
    _$SomethingDataRecord
  ];
  @override
  final String wireName = 'SomethingDataRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SomethingDataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.listData;
    if (value != null) {
      result
        ..add('listData')
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
  SomethingDataRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SomethingDataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'listData':
          result.listData.replace(serializers.deserialize(value,
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

class _$SomethingDataRecord extends SomethingDataRecord {
  @override
  final String? text;
  @override
  final BuiltList<String>? listData;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SomethingDataRecord(
          [void Function(SomethingDataRecordBuilder)? updates]) =>
      (new SomethingDataRecordBuilder()..update(updates))._build();

  _$SomethingDataRecord._({this.text, this.listData, this.ffRef}) : super._();

  @override
  SomethingDataRecord rebuild(
          void Function(SomethingDataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SomethingDataRecordBuilder toBuilder() =>
      new SomethingDataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SomethingDataRecord &&
        text == other.text &&
        listData == other.listData &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, listData.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SomethingDataRecord')
          ..add('text', text)
          ..add('listData', listData)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SomethingDataRecordBuilder
    implements Builder<SomethingDataRecord, SomethingDataRecordBuilder> {
  _$SomethingDataRecord? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ListBuilder<String>? _listData;
  ListBuilder<String> get listData =>
      _$this._listData ??= new ListBuilder<String>();
  set listData(ListBuilder<String>? listData) => _$this._listData = listData;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SomethingDataRecordBuilder() {
    SomethingDataRecord._initializeBuilder(this);
  }

  SomethingDataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _listData = $v.listData?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SomethingDataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SomethingDataRecord;
  }

  @override
  void update(void Function(SomethingDataRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SomethingDataRecord build() => _build();

  _$SomethingDataRecord _build() {
    _$SomethingDataRecord _$result;
    try {
      _$result = _$v ??
          new _$SomethingDataRecord._(
              text: text, listData: _listData?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'listData';
        _listData?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SomethingDataRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
