// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TopicListRecord> _$topicListRecordSerializer =
    new _$TopicListRecordSerializer();

class _$TopicListRecordSerializer
    implements StructuredSerializer<TopicListRecord> {
  @override
  final Iterable<Type> types = const [TopicListRecord, _$TopicListRecord];
  @override
  final String wireName = 'TopicListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TopicListRecord object,
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
    value = object.hits;
    if (value != null) {
      result
        ..add('hits')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  TopicListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TopicListRecordBuilder();

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
        case 'subject':
          result.subject = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hits':
          result.hits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$TopicListRecord extends TopicListRecord {
  @override
  final DateTime? createDate;
  @override
  final DocumentReference<Object?>? createBy;
  @override
  final int? status;
  @override
  final String? subject;
  @override
  final String? detail;
  @override
  final int? hits;
  @override
  final DateTime? updateDate;
  @override
  final DocumentReference<Object?>? updateBy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TopicListRecord([void Function(TopicListRecordBuilder)? updates]) =>
      (new TopicListRecordBuilder()..update(updates))._build();

  _$TopicListRecord._(
      {this.createDate,
      this.createBy,
      this.status,
      this.subject,
      this.detail,
      this.hits,
      this.updateDate,
      this.updateBy,
      this.ffRef})
      : super._();

  @override
  TopicListRecord rebuild(void Function(TopicListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopicListRecordBuilder toBuilder() =>
      new TopicListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopicListRecord &&
        createDate == other.createDate &&
        createBy == other.createBy &&
        status == other.status &&
        subject == other.subject &&
        detail == other.detail &&
        hits == other.hits &&
        updateDate == other.updateDate &&
        updateBy == other.updateBy &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, createBy.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, hits.hashCode);
    _$hash = $jc(_$hash, updateDate.hashCode);
    _$hash = $jc(_$hash, updateBy.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopicListRecord')
          ..add('createDate', createDate)
          ..add('createBy', createBy)
          ..add('status', status)
          ..add('subject', subject)
          ..add('detail', detail)
          ..add('hits', hits)
          ..add('updateDate', updateDate)
          ..add('updateBy', updateBy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TopicListRecordBuilder
    implements Builder<TopicListRecord, TopicListRecordBuilder> {
  _$TopicListRecord? _$v;

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

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(String? detail) => _$this._detail = detail;

  int? _hits;
  int? get hits => _$this._hits;
  set hits(int? hits) => _$this._hits = hits;

  DateTime? _updateDate;
  DateTime? get updateDate => _$this._updateDate;
  set updateDate(DateTime? updateDate) => _$this._updateDate = updateDate;

  DocumentReference<Object?>? _updateBy;
  DocumentReference<Object?>? get updateBy => _$this._updateBy;
  set updateBy(DocumentReference<Object?>? updateBy) =>
      _$this._updateBy = updateBy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TopicListRecordBuilder() {
    TopicListRecord._initializeBuilder(this);
  }

  TopicListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createDate = $v.createDate;
      _createBy = $v.createBy;
      _status = $v.status;
      _subject = $v.subject;
      _detail = $v.detail;
      _hits = $v.hits;
      _updateDate = $v.updateDate;
      _updateBy = $v.updateBy;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopicListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopicListRecord;
  }

  @override
  void update(void Function(TopicListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopicListRecord build() => _build();

  _$TopicListRecord _build() {
    final _$result = _$v ??
        new _$TopicListRecord._(
            createDate: createDate,
            createBy: createBy,
            status: status,
            subject: subject,
            detail: detail,
            hits: hits,
            updateDate: updateDate,
            updateBy: updateBy,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
