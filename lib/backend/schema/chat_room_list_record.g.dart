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
  final DocumentReference<Object?>? ffRef;

  factory _$ChatRoomListRecord(
          [void Function(ChatRoomListRecordBuilder)? updates]) =>
      (new ChatRoomListRecordBuilder()..update(updates))._build();

  _$ChatRoomListRecord._({this.createDate, this.ffRef}) : super._();

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
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, createDate.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatRoomListRecord')
          ..add('createDate', createDate)
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
    final _$result =
        _$v ?? new _$ChatRoomListRecord._(createDate: createDate, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
