// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_post_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentsPostRecord> _$commentsPostRecordSerializer =
    new _$CommentsPostRecordSerializer();

class _$CommentsPostRecordSerializer
    implements StructuredSerializer<CommentsPostRecord> {
  @override
  final Iterable<Type> types = const [CommentsPostRecord, _$CommentsPostRecord];
  @override
  final String wireName = 'CommentsPostRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CommentsPostRecord object,
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
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
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
  CommentsPostRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentsPostRecordBuilder();

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
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
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

class _$CommentsPostRecord extends CommentsPostRecord {
  @override
  final String? text;
  @override
  final String? img;
  @override
  final double? rating;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommentsPostRecord(
          [void Function(CommentsPostRecordBuilder)? updates]) =>
      (new CommentsPostRecordBuilder()..update(updates))._build();

  _$CommentsPostRecord._(
      {this.text,
      this.img,
      this.rating,
      this.createdBy,
      this.createdAt,
      this.ffRef})
      : super._();

  @override
  CommentsPostRecord rebuild(
          void Function(CommentsPostRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentsPostRecordBuilder toBuilder() =>
      new CommentsPostRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentsPostRecord &&
        text == other.text &&
        img == other.img &&
        rating == other.rating &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, text.hashCode), img.hashCode), rating.hashCode),
                createdBy.hashCode),
            createdAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentsPostRecord')
          ..add('text', text)
          ..add('img', img)
          ..add('rating', rating)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommentsPostRecordBuilder
    implements Builder<CommentsPostRecord, CommentsPostRecordBuilder> {
  _$CommentsPostRecord? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CommentsPostRecordBuilder() {
    CommentsPostRecord._initializeBuilder(this);
  }

  CommentsPostRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _img = $v.img;
      _rating = $v.rating;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentsPostRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentsPostRecord;
  }

  @override
  void update(void Function(CommentsPostRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentsPostRecord build() => _build();

  _$CommentsPostRecord _build() {
    final _$result = _$v ??
        new _$CommentsPostRecord._(
            text: text,
            img: img,
            rating: rating,
            createdBy: createdBy,
            createdAt: createdAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
