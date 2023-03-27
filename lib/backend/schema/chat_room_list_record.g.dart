// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatRoomListRecord> _$chatRoomListRecordSerializer =
    new _$ChatRoomListRecordSerializer();

class _$ChatRoomListRecordSerializer
    implements StructuredSerializer<ChatRoomListRecord> {
  @override
  final Iterable<Type> types = const [ChatRoomListRecord, _$ChatRoomListRecord];
  @override
  final String wireName = 'ChatRoomListRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChatRoomListRecord object,
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.updateDate;
    if (value != null) {
      result
        ..add('update_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.partner;
    if (value != null) {
      result
        ..add('partner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lastMessage;
    if (value != null) {
      result
        ..add('last_message')
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
  ChatRoomListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatRoomListRecordBuilder();

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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'update_date':
          result.updateDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'partner':
          result.partner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'last_message':
          result.lastMessage = serializers.deserialize(value,
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

class _$ChatRoomListRecord extends ChatRoomListRecord {
  @override
  final DateTime? createDate;
  @override
  final DocumentReference<Object?>? createBy;
  @override
  final int? status;
  @override
  final DateTime? updateDate;
  @override
  final DocumentReference<Object?>? partner;
  @override
  final String? lastMessage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatRoomListRecord(
          [void Function(ChatRoomListRecordBuilder)? updates]) =>
      (new ChatRoomListRecordBuilder()..update(updates))._build();

  _$ChatRoomListRecord._(
      {this.createDate,
      this.createBy,
      this.status,
      this.updateDate,
      this.partner,
      this.lastMessage,
      this.ffRef})
      : super._();

  @override
  ChatRoomListRecord rebuild(
          void Function(ChatRoomListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatRoomListRecordBuilder toBuilder() =>
      new ChatRoomListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatRoomListRecord &&
        createDate == other.createDate &&
        createBy == other.createBy &&
        status == other.status &&
        updateDate == other.updateDate &&
        partner == other.partner &&
        lastMessage == other.lastMessage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, createBy.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, updateDate.hashCode);
    _$hash = $jc(_$hash, partner.hashCode);
    _$hash = $jc(_$hash, lastMessage.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatRoomListRecord')
          ..add('createDate', createDate)
          ..add('createBy', createBy)
          ..add('status', status)
          ..add('updateDate', updateDate)
          ..add('partner', partner)
          ..add('lastMessage', lastMessage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatRoomListRecordBuilder
    implements Builder<ChatRoomListRecord, ChatRoomListRecordBuilder> {
  _$ChatRoomListRecord? _$v;

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  DocumentReference<Object?>? _createBy;
  DocumentReference<Object?>? get createBy => _$this._createBy;
  set createBy(DocumentReference<Object?>? createBy) =>
      _$this._createBy = createBy;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  DateTime? _updateDate;
  DateTime? get updateDate => _$this._updateDate;
  set updateDate(DateTime? updateDate) => _$this._updateDate = updateDate;

  DocumentReference<Object?>? _partner;
  DocumentReference<Object?>? get partner => _$this._partner;
  set partner(DocumentReference<Object?>? partner) => _$this._partner = partner;

  String? _lastMessage;
  String? get lastMessage => _$this._lastMessage;
  set lastMessage(String? lastMessage) => _$this._lastMessage = lastMessage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatRoomListRecordBuilder() {
    ChatRoomListRecord._initializeBuilder(this);
  }

  ChatRoomListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createDate = $v.createDate;
      _createBy = $v.createBy;
      _status = $v.status;
      _updateDate = $v.updateDate;
      _partner = $v.partner;
      _lastMessage = $v.lastMessage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatRoomListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatRoomListRecord;
  }

  @override
  void update(void Function(ChatRoomListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatRoomListRecord build() => _build();

  _$ChatRoomListRecord _build() {
    final _$result = _$v ??
        new _$ChatRoomListRecord._(
            createDate: createDate,
            createBy: createBy,
            status: status,
            updateDate: updateDate,
            partner: partner,
            lastMessage: lastMessage,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
