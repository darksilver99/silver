// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_sub_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatRoomSubListRecord> _$chatRoomSubListRecordSerializer =
    new _$ChatRoomSubListRecordSerializer();

class _$ChatRoomSubListRecordSerializer
    implements StructuredSerializer<ChatRoomSubListRecord> {
  @override
  final Iterable<Type> types = const [
    ChatRoomSubListRecord,
    _$ChatRoomSubListRecord
  ];
  @override
  final String wireName = 'ChatRoomSubListRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChatRoomSubListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createBy;
    if (value != null) {
      result
        ..add('create_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ChatRoomSubListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatRoomSubListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'create_by':
          result.createBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ChatRoomSubListRecord extends ChatRoomSubListRecord {
  @override
  final DocumentReference<Object?>? createBy;
  @override
  final DateTime? createDate;
  @override
  final int? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatRoomSubListRecord(
          [void Function(ChatRoomSubListRecordBuilder)? updates]) =>
      (new ChatRoomSubListRecordBuilder()..update(updates))._build();

  _$ChatRoomSubListRecord._(
      {this.createBy, this.createDate, this.status, this.ffRef})
      : super._();

  @override
  ChatRoomSubListRecord rebuild(
          void Function(ChatRoomSubListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatRoomSubListRecordBuilder toBuilder() =>
      new ChatRoomSubListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatRoomSubListRecord &&
        createBy == other.createBy &&
        createDate == other.createDate &&
        status == other.status &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createBy.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatRoomSubListRecord')
          ..add('createBy', createBy)
          ..add('createDate', createDate)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatRoomSubListRecordBuilder
    implements Builder<ChatRoomSubListRecord, ChatRoomSubListRecordBuilder> {
  _$ChatRoomSubListRecord? _$v;

  DocumentReference<Object?>? _createBy;
  DocumentReference<Object?>? get createBy => _$this._createBy;
  set createBy(DocumentReference<Object?>? createBy) =>
      _$this._createBy = createBy;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatRoomSubListRecordBuilder() {
    ChatRoomSubListRecord._initializeBuilder(this);
  }

  ChatRoomSubListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createBy = $v.createBy;
      _createDate = $v.createDate;
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatRoomSubListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatRoomSubListRecord;
  }

  @override
  void update(void Function(ChatRoomSubListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatRoomSubListRecord build() => _build();

  _$ChatRoomSubListRecord _build() {
    final _$result = _$v ??
        new _$ChatRoomSubListRecord._(
            createBy: createBy,
            createDate: createDate,
            status: status,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
