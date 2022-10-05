// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoriesRecord> _$storiesRecordSerializer =
    new _$StoriesRecordSerializer();

class _$StoriesRecordSerializer implements StructuredSerializer<StoriesRecord> {
  @override
  final Iterable<Type> types = const [StoriesRecord, _$StoriesRecord];
  @override
  final String wireName = 'StoriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('Created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.imgStories;
    if (value != null) {
      result
        ..add('img_stories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.storiesID;
    if (value != null) {
      result
        ..add('StoriesID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.isBuisness;
    if (value != null) {
      result
        ..add('isBuisness')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.timer;
    if (value != null) {
      result
        ..add('timer')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
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
  StoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'img_stories':
          result.imgStories = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'StoriesID':
          result.storiesID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'isBuisness':
          result.isBuisness = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'timer':
          result.timer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
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

class _$StoriesRecord extends StoriesRecord {
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final String? name;
  @override
  final DateTime? createdAt;
  @override
  final String? imgStories;
  @override
  final String? category;
  @override
  final BuiltList<DocumentReference<Object?>>? categories;
  @override
  final String? storiesID;
  @override
  final BuiltList<double>? rating;
  @override
  final bool? isBuisness;
  @override
  final int? timer;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StoriesRecord([void Function(StoriesRecordBuilder)? updates]) =>
      (new StoriesRecordBuilder()..update(updates))._build();

  _$StoriesRecord._(
      {this.createdBy,
      this.name,
      this.createdAt,
      this.imgStories,
      this.category,
      this.categories,
      this.storiesID,
      this.rating,
      this.isBuisness,
      this.timer,
      this.description,
      this.ffRef})
      : super._();

  @override
  StoriesRecord rebuild(void Function(StoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoriesRecordBuilder toBuilder() => new StoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoriesRecord &&
        createdBy == other.createdBy &&
        name == other.name &&
        createdAt == other.createdAt &&
        imgStories == other.imgStories &&
        category == other.category &&
        categories == other.categories &&
        storiesID == other.storiesID &&
        rating == other.rating &&
        isBuisness == other.isBuisness &&
        timer == other.timer &&
        description == other.description &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, createdBy.hashCode),
                                                name.hashCode),
                                            createdAt.hashCode),
                                        imgStories.hashCode),
                                    category.hashCode),
                                categories.hashCode),
                            storiesID.hashCode),
                        rating.hashCode),
                    isBuisness.hashCode),
                timer.hashCode),
            description.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StoriesRecord')
          ..add('createdBy', createdBy)
          ..add('name', name)
          ..add('createdAt', createdAt)
          ..add('imgStories', imgStories)
          ..add('category', category)
          ..add('categories', categories)
          ..add('storiesID', storiesID)
          ..add('rating', rating)
          ..add('isBuisness', isBuisness)
          ..add('timer', timer)
          ..add('description', description)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StoriesRecordBuilder
    implements Builder<StoriesRecord, StoriesRecordBuilder> {
  _$StoriesRecord? _$v;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _imgStories;
  String? get imgStories => _$this._imgStories;
  set imgStories(String? imgStories) => _$this._imgStories = imgStories;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  ListBuilder<DocumentReference<Object?>>? _categories;
  ListBuilder<DocumentReference<Object?>> get categories =>
      _$this._categories ??= new ListBuilder<DocumentReference<Object?>>();
  set categories(ListBuilder<DocumentReference<Object?>>? categories) =>
      _$this._categories = categories;

  String? _storiesID;
  String? get storiesID => _$this._storiesID;
  set storiesID(String? storiesID) => _$this._storiesID = storiesID;

  ListBuilder<double>? _rating;
  ListBuilder<double> get rating =>
      _$this._rating ??= new ListBuilder<double>();
  set rating(ListBuilder<double>? rating) => _$this._rating = rating;

  bool? _isBuisness;
  bool? get isBuisness => _$this._isBuisness;
  set isBuisness(bool? isBuisness) => _$this._isBuisness = isBuisness;

  int? _timer;
  int? get timer => _$this._timer;
  set timer(int? timer) => _$this._timer = timer;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StoriesRecordBuilder() {
    StoriesRecord._initializeBuilder(this);
  }

  StoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdBy = $v.createdBy;
      _name = $v.name;
      _createdAt = $v.createdAt;
      _imgStories = $v.imgStories;
      _category = $v.category;
      _categories = $v.categories?.toBuilder();
      _storiesID = $v.storiesID;
      _rating = $v.rating?.toBuilder();
      _isBuisness = $v.isBuisness;
      _timer = $v.timer;
      _description = $v.description;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoriesRecord;
  }

  @override
  void update(void Function(StoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoriesRecord build() => _build();

  _$StoriesRecord _build() {
    _$StoriesRecord _$result;
    try {
      _$result = _$v ??
          new _$StoriesRecord._(
              createdBy: createdBy,
              name: name,
              createdAt: createdAt,
              imgStories: imgStories,
              category: category,
              categories: _categories?.build(),
              storiesID: storiesID,
              rating: _rating?.build(),
              isBuisness: isBuisness,
              timer: timer,
              description: description,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();

        _$failedField = 'rating';
        _rating?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StoriesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
