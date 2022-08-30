// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_salon_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategorySalonRecord> _$categorySalonRecordSerializer =
    new _$CategorySalonRecordSerializer();

class _$CategorySalonRecordSerializer
    implements StructuredSerializer<CategorySalonRecord> {
  @override
  final Iterable<Type> types = const [
    CategorySalonRecord,
    _$CategorySalonRecord
  ];
  @override
  final String wireName = 'CategorySalonRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CategorySalonRecord object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.linkSalon;
    if (value != null) {
      result
        ..add('link_salon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.linkStories;
    if (value != null) {
      result
        ..add('link_stories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.countStories;
    if (value != null) {
      result
        ..add('count_stories')
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
  CategorySalonRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategorySalonRecordBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link_salon':
          result.linkSalon.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'link_stories':
          result.linkStories.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'count_stories':
          result.countStories = serializers.deserialize(value,
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

class _$CategorySalonRecord extends CategorySalonRecord {
  @override
  final String? name;
  @override
  final String? image;
  @override
  final BuiltList<DocumentReference<Object?>>? linkSalon;
  @override
  final BuiltList<DocumentReference<Object?>>? linkStories;
  @override
  final int? countStories;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CategorySalonRecord(
          [void Function(CategorySalonRecordBuilder)? updates]) =>
      (new CategorySalonRecordBuilder()..update(updates))._build();

  _$CategorySalonRecord._(
      {this.name,
      this.image,
      this.linkSalon,
      this.linkStories,
      this.countStories,
      this.ffRef})
      : super._();

  @override
  CategorySalonRecord rebuild(
          void Function(CategorySalonRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategorySalonRecordBuilder toBuilder() =>
      new CategorySalonRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategorySalonRecord &&
        name == other.name &&
        image == other.image &&
        linkSalon == other.linkSalon &&
        linkStories == other.linkStories &&
        countStories == other.countStories &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), image.hashCode),
                    linkSalon.hashCode),
                linkStories.hashCode),
            countStories.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategorySalonRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('linkSalon', linkSalon)
          ..add('linkStories', linkStories)
          ..add('countStories', countStories)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CategorySalonRecordBuilder
    implements Builder<CategorySalonRecord, CategorySalonRecordBuilder> {
  _$CategorySalonRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<DocumentReference<Object?>>? _linkSalon;
  ListBuilder<DocumentReference<Object?>> get linkSalon =>
      _$this._linkSalon ??= new ListBuilder<DocumentReference<Object?>>();
  set linkSalon(ListBuilder<DocumentReference<Object?>>? linkSalon) =>
      _$this._linkSalon = linkSalon;

  ListBuilder<DocumentReference<Object?>>? _linkStories;
  ListBuilder<DocumentReference<Object?>> get linkStories =>
      _$this._linkStories ??= new ListBuilder<DocumentReference<Object?>>();
  set linkStories(ListBuilder<DocumentReference<Object?>>? linkStories) =>
      _$this._linkStories = linkStories;

  int? _countStories;
  int? get countStories => _$this._countStories;
  set countStories(int? countStories) => _$this._countStories = countStories;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CategorySalonRecordBuilder() {
    CategorySalonRecord._initializeBuilder(this);
  }

  CategorySalonRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _linkSalon = $v.linkSalon?.toBuilder();
      _linkStories = $v.linkStories?.toBuilder();
      _countStories = $v.countStories;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategorySalonRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategorySalonRecord;
  }

  @override
  void update(void Function(CategorySalonRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategorySalonRecord build() => _build();

  _$CategorySalonRecord _build() {
    _$CategorySalonRecord _$result;
    try {
      _$result = _$v ??
          new _$CategorySalonRecord._(
              name: name,
              image: image,
              linkSalon: _linkSalon?.build(),
              linkStories: _linkStories?.build(),
              countStories: countStories,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'linkSalon';
        _linkSalon?.build();
        _$failedField = 'linkStories';
        _linkStories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategorySalonRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
