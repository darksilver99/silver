// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_sub_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TopicSubListRecord> _$topicSubListRecordSerializer =
    new _$TopicSubListRecordSerializer();

class _$TopicSubListRecordSerializer
    implements StructuredSerializer<TopicSubListRecord> {
  @override
  final Iterable<Type> types = const [TopicSubListRecord, _$TopicSubListRecord];
  @override
  final String wireName = 'TopicSubListRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TopicSubListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
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
  TopicSubListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TopicSubListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
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
        case 'subject':
          result.subject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
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

class _$TopicSubListRecord extends TopicSubListRecord {
  @override
  final int? status;
  @override
  final DateTime? createDate;
  @override
  final DocumentReference<Object?>? createBy;
  @override
  final DateTime? updateDate;
  @override
  final DocumentReference<Object?>? updateBy;
  @override
  final String? subject;
  @override
  final String? detail;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TopicSubListRecord(
          [void Function(TopicSubListRecordBuilder)? updates]) =>
      (new TopicSubListRecordBuilder()..update(updates))._build();

  _$TopicSubListRecord._(
      {this.status,
      this.createDate,
      this.createBy,
      this.updateDate,
      this.updateBy,
      this.subject,
      this.detail,
      this.ffRef})
      : super._();

  @override
  TopicSubListRecord rebuild(
          void Function(TopicSubListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopicSubListRecordBuilder toBuilder() =>
      new TopicSubListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopicSubListRecord &&
        status == other.status &&
        createDate == other.createDate &&
        createBy == other.createBy &&
        updateDate == other.updateDate &&
        updateBy == other.updateBy &&
        subject == other.subject &&
        detail == other.detail &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, createBy.hashCode);
    _$hash = $jc(_$hash, updateDate.hashCode);
    _$hash = $jc(_$hash, updateBy.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopicSubListRecord')
          ..add('status', status)
          ..add('createDate', createDate)
          ..add('createBy', createBy)
          ..add('updateDate', updateDate)
          ..add('updateBy', updateBy)
          ..add('subject', subject)
          ..add('detail', detail)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TopicSubListRecordBuilder
    implements Builder<TopicSubListRecord, TopicSubListRecordBuilder> {
  _$TopicSubListRecord? _$v;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

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

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(String? detail) => _$this._detail = detail;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TopicSubListRecordBuilder() {
    TopicSubListRecord._initializeBuilder(this);
  }

  TopicSubListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _createDate = $v.createDate;
      _createBy = $v.createBy;
      _updateDate = $v.updateDate;
      _updateBy = $v.updateBy;
      _subject = $v.subject;
      _detail = $v.detail;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopicSubListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopicSubListRecord;
  }

  @override
  void update(void Function(TopicSubListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopicSubListRecord build() => _build();

  _$TopicSubListRecord _build() {
    final _$result = _$v ??
        new _$TopicSubListRecord._(
            status: status,
            createDate: createDate,
            createBy: createBy,
            updateDate: updateDate,
            updateBy: updateBy,
            subject: subject,
            detail: detail,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
