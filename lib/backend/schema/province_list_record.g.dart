// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProvinceListRecord> _$provinceListRecordSerializer =
    new _$ProvinceListRecordSerializer();

class _$ProvinceListRecordSerializer
    implements StructuredSerializer<ProvinceListRecord> {
  @override
  final Iterable<Type> types = const [ProvinceListRecord, _$ProvinceListRecord];
  @override
  final String wireName = 'ProvinceListRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProvinceListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postCode;
    if (value != null) {
      result
        ..add('postCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  ProvinceListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProvinceListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postCode':
          result.postCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$ProvinceListRecord extends ProvinceListRecord {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? postCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProvinceListRecord(
          [void Function(ProvinceListRecordBuilder)? updates]) =>
      (new ProvinceListRecordBuilder()..update(updates))._build();

  _$ProvinceListRecord._({this.id, this.name, this.postCode, this.ffRef})
      : super._();

  @override
  ProvinceListRecord rebuild(
          void Function(ProvinceListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProvinceListRecordBuilder toBuilder() =>
      new ProvinceListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProvinceListRecord &&
        id == other.id &&
        name == other.name &&
        postCode == other.postCode &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, postCode.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProvinceListRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('postCode', postCode)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProvinceListRecordBuilder
    implements Builder<ProvinceListRecord, ProvinceListRecordBuilder> {
  _$ProvinceListRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _postCode;
  String? get postCode => _$this._postCode;
  set postCode(String? postCode) => _$this._postCode = postCode;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProvinceListRecordBuilder() {
    ProvinceListRecord._initializeBuilder(this);
  }

  ProvinceListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _postCode = $v.postCode;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProvinceListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProvinceListRecord;
  }

  @override
  void update(void Function(ProvinceListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProvinceListRecord build() => _build();

  _$ProvinceListRecord _build() {
    final _$result = _$v ??
        new _$ProvinceListRecord._(
            id: id, name: name, postCode: postCode, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
