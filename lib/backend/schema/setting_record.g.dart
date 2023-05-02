// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SettingRecord> _$settingRecordSerializer =
    new _$SettingRecordSerializer();

class _$SettingRecordSerializer implements StructuredSerializer<SettingRecord> {
  @override
  final Iterable<Type> types = const [SettingRecord, _$SettingRecord];
  @override
  final String wireName = 'SettingRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SettingRecord object,
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
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  SettingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SettingRecordBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$SettingRecord extends SettingRecord {
  @override
  final String? text;
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SettingRecord([void Function(SettingRecordBuilder)? updates]) =>
      (new SettingRecordBuilder()..update(updates))._build();

  _$SettingRecord._({this.text, this.type, this.ffRef}) : super._();

  @override
  SettingRecord rebuild(void Function(SettingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingRecordBuilder toBuilder() => new SettingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingRecord &&
        text == other.text &&
        type == other.type &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SettingRecord')
          ..add('text', text)
          ..add('type', type)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SettingRecordBuilder
    implements Builder<SettingRecord, SettingRecordBuilder> {
  _$SettingRecord? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SettingRecordBuilder() {
    SettingRecord._initializeBuilder(this);
  }

  SettingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _type = $v.type;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SettingRecord;
  }

  @override
  void update(void Function(SettingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SettingRecord build() => _build();

  _$SettingRecord _build() {
    final _$result =
        _$v ?? new _$SettingRecord._(text: text, type: type, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
