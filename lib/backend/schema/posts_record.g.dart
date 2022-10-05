// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostsRecord object,
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
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.likedBy;
    if (value != null) {
      result
        ..add('Liked_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.firstPhoto;
    if (value != null) {
      result
        ..add('first_photo')
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
    value = object.isBusiness;
    if (value != null) {
      result
        ..add('isBusiness')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.linkCategory;
    if (value != null) {
      result
        ..add('link_category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.walkIns;
    if (value != null) {
      result
        ..add('walk_ins')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.following;
    if (value != null) {
      result
        ..add('following')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.videoReels;
    if (value != null) {
      result
        ..add('video_reels')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PostsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

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
          result.image.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Liked_by':
          result.likedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'first_photo':
          result.firstPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isBusiness':
          result.isBusiness = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'link_category':
          result.linkCategory = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'walk_ins':
          result.walkIns = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'video_reels':
          result.videoReels = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PostsRecord extends PostsRecord {
  @override
  final String? name;
  @override
  final BuiltList<String>? image;
  @override
  final BuiltList<DocumentReference<Object?>>? likedBy;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final String? firstPhoto;
  @override
  final String? category;
  @override
  final bool? isBusiness;
  @override
  final LatLng? location;
  @override
  final DocumentReference<Object?>? linkCategory;
  @override
  final bool? walkIns;
  @override
  final BuiltList<DocumentReference<Object?>>? following;
  @override
  final String? videoReels;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostsRecord([void Function(PostsRecordBuilder)? updates]) =>
      (new PostsRecordBuilder()..update(updates))._build();

  _$PostsRecord._(
      {this.name,
      this.image,
      this.likedBy,
      this.createdAt,
      this.createdBy,
      this.firstPhoto,
      this.category,
      this.isBusiness,
      this.location,
      this.linkCategory,
      this.walkIns,
      this.following,
      this.videoReels,
      this.description,
      this.ffRef})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        name == other.name &&
        image == other.image &&
        likedBy == other.likedBy &&
        createdAt == other.createdAt &&
        createdBy == other.createdBy &&
        firstPhoto == other.firstPhoto &&
        category == other.category &&
        isBusiness == other.isBusiness &&
        location == other.location &&
        linkCategory == other.linkCategory &&
        walkIns == other.walkIns &&
        following == other.following &&
        videoReels == other.videoReels &&
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(0,
                                                                name.hashCode),
                                                            image.hashCode),
                                                        likedBy.hashCode),
                                                    createdAt.hashCode),
                                                createdBy.hashCode),
                                            firstPhoto.hashCode),
                                        category.hashCode),
                                    isBusiness.hashCode),
                                location.hashCode),
                            linkCategory.hashCode),
                        walkIns.hashCode),
                    following.hashCode),
                videoReels.hashCode),
            description.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostsRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('likedBy', likedBy)
          ..add('createdAt', createdAt)
          ..add('createdBy', createdBy)
          ..add('firstPhoto', firstPhoto)
          ..add('category', category)
          ..add('isBusiness', isBusiness)
          ..add('location', location)
          ..add('linkCategory', linkCategory)
          ..add('walkIns', walkIns)
          ..add('following', following)
          ..add('videoReels', videoReels)
          ..add('description', description)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _image;
  ListBuilder<String> get image => _$this._image ??= new ListBuilder<String>();
  set image(ListBuilder<String>? image) => _$this._image = image;

  ListBuilder<DocumentReference<Object?>>? _likedBy;
  ListBuilder<DocumentReference<Object?>> get likedBy =>
      _$this._likedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set likedBy(ListBuilder<DocumentReference<Object?>>? likedBy) =>
      _$this._likedBy = likedBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  String? _firstPhoto;
  String? get firstPhoto => _$this._firstPhoto;
  set firstPhoto(String? firstPhoto) => _$this._firstPhoto = firstPhoto;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  bool? _isBusiness;
  bool? get isBusiness => _$this._isBusiness;
  set isBusiness(bool? isBusiness) => _$this._isBusiness = isBusiness;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DocumentReference<Object?>? _linkCategory;
  DocumentReference<Object?>? get linkCategory => _$this._linkCategory;
  set linkCategory(DocumentReference<Object?>? linkCategory) =>
      _$this._linkCategory = linkCategory;

  bool? _walkIns;
  bool? get walkIns => _$this._walkIns;
  set walkIns(bool? walkIns) => _$this._walkIns = walkIns;

  ListBuilder<DocumentReference<Object?>>? _following;
  ListBuilder<DocumentReference<Object?>> get following =>
      _$this._following ??= new ListBuilder<DocumentReference<Object?>>();
  set following(ListBuilder<DocumentReference<Object?>>? following) =>
      _$this._following = following;

  String? _videoReels;
  String? get videoReels => _$this._videoReels;
  set videoReels(String? videoReels) => _$this._videoReels = videoReels;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image?.toBuilder();
      _likedBy = $v.likedBy?.toBuilder();
      _createdAt = $v.createdAt;
      _createdBy = $v.createdBy;
      _firstPhoto = $v.firstPhoto;
      _category = $v.category;
      _isBusiness = $v.isBusiness;
      _location = $v.location;
      _linkCategory = $v.linkCategory;
      _walkIns = $v.walkIns;
      _following = $v.following?.toBuilder();
      _videoReels = $v.videoReels;
      _description = $v.description;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostsRecord build() => _build();

  _$PostsRecord _build() {
    _$PostsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostsRecord._(
              name: name,
              image: _image?.build(),
              likedBy: _likedBy?.build(),
              createdAt: createdAt,
              createdBy: createdBy,
              firstPhoto: firstPhoto,
              category: category,
              isBusiness: isBusiness,
              location: location,
              linkCategory: linkCategory,
              walkIns: walkIns,
              following: _following?.build(),
              videoReels: videoReels,
              description: description,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
        _$failedField = 'likedBy';
        _likedBy?.build();

        _$failedField = 'following';
        _following?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
