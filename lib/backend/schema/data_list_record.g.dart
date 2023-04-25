// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataListRecord> _$dataListRecordSerializer =
    new _$DataListRecordSerializer();

class _$DataListRecordSerializer
    implements StructuredSerializer<DataListRecord> {
  @override
  final Iterable<Type> types = const [DataListRecord, _$DataListRecord];
  @override
  final String wireName = 'DataListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DataListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    value = object.searchText;
    if (value != null) {
      result
        ..add('searchText')
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
  DataListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'searchText':
          result.searchText = serializers.deserialize(value,
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

class _$DataListRecord extends DataListRecord {
  @override
  final String? name;
  @override
  final String? detail;
  @override
  final String? searchText;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DataListRecord([void Function(DataListRecordBuilder)? updates]) =>
      (new DataListRecordBuilder()..update(updates))._build();

  _$DataListRecord._({this.name, this.detail, this.searchText, this.ffRef})
      : super._();

  @override
  DataListRecord rebuild(void Function(DataListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataListRecordBuilder toBuilder() =>
      new DataListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataListRecord &&
        name == other.name &&
        detail == other.detail &&
        searchText == other.searchText &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, searchText.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DataListRecord')
          ..add('name', name)
          ..add('detail', detail)
          ..add('searchText', searchText)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DataListRecordBuilder
    implements Builder<DataListRecord, DataListRecordBuilder> {
  _$DataListRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(String? detail) => _$this._detail = detail;

  String? _searchText;
  String? get searchText => _$this._searchText;
  set searchText(String? searchText) => _$this._searchText = searchText;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DataListRecordBuilder() {
    DataListRecord._initializeBuilder(this);
  }

  DataListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _detail = $v.detail;
      _searchText = $v.searchText;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DataListRecord;
  }

  @override
  void update(void Function(DataListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataListRecord build() => _build();

  _$DataListRecord _build() {
    final _$result = _$v ??
        new _$DataListRecord._(
            name: name, detail: detail, searchText: searchText, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
