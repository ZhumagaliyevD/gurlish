// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photos;
    if (value != null) {
      result
        ..add('photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.wishlistPhotos;
    if (value != null) {
      result
        ..add('wishlist_photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.userType;
    if (value != null) {
      result
        ..add('user_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.adresMap;
    if (value != null) {
      result
        ..add('adres_map')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.adreText;
    if (value != null) {
      result
        ..add('adre_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.linkPost;
    if (value != null) {
      result
        ..add('link_post')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.linkPricelist;
    if (value != null) {
      result
        ..add('link_pricelist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.isSalon;
    if (value != null) {
      result
        ..add('isSalon')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.followers;
    if (value != null) {
      result
        ..add('Followers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.inst;
    if (value != null) {
      result
        ..add('inst')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.facebook;
    if (value != null) {
      result
        ..add('facebook')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whats;
    if (value != null) {
      result
        ..add('whats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isMobile;
    if (value != null) {
      result
        ..add('isMobile')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.adresCity;
    if (value != null) {
      result
        ..add('adres_city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isSubs;
    if (value != null) {
      result
        ..add('isSubs')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.authEnd;
    if (value != null) {
      result
        ..add('auth_end')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.averageRating;
    if (value != null) {
      result
        ..add('averageRating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.likedCategory;
    if (value != null) {
      result
        ..add('likedCategory')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.adressSelected;
    if (value != null) {
      result
        ..add('adressSelected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.walkIns;
    if (value != null) {
      result
        ..add('walk_ins')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.linkFavCategories;
    if (value != null) {
      result
        ..add('link_fav_categories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.sredOcenka;
    if (value != null) {
      result
        ..add('sredOcenka')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.serviceType;
    if (value != null) {
      result
        ..add('service_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isAdmin;
    if (value != null) {
      result
        ..add('isAdmin')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photos':
          result.photos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'wishlist_photos':
          result.wishlistPhotos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'user_type':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'adres_map':
          result.adresMap = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'adre_text':
          result.adreText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link_post':
          result.linkPost.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'link_pricelist':
          result.linkPricelist.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'isSalon':
          result.isSalon = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Followers':
          result.followers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'rating':
          result.rating.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'inst':
          result.inst = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'facebook':
          result.facebook = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'whats':
          result.whats = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isMobile':
          result.isMobile = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'adres_city':
          result.adresCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isSubs':
          result.isSubs = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'auth_end':
          result.authEnd = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'averageRating':
          result.averageRating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'likedCategory':
          result.likedCategory.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'adressSelected':
          result.adressSelected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'walk_ins':
          result.walkIns = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'link_fav_categories':
          result.linkFavCategories.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'sredOcenka':
          result.sredOcenka = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'service_type':
          result.serviceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isAdmin':
          result.isAdmin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final BuiltList<String>? photos;
  @override
  final BuiltList<String>? wishlistPhotos;
  @override
  final String? userType;
  @override
  final LatLng? adresMap;
  @override
  final String? adreText;
  @override
  final BuiltList<DocumentReference<Object?>>? linkPost;
  @override
  final BuiltList<DocumentReference<Object?>>? linkPricelist;
  @override
  final bool? isSalon;
  @override
  final String? category;
  @override
  final BuiltList<DocumentReference<Object?>>? followers;
  @override
  final BuiltList<DocumentReference<Object?>>? following;
  @override
  final BuiltList<double>? rating;
  @override
  final String? role;
  @override
  final String? inst;
  @override
  final String? facebook;
  @override
  final String? whats;
  @override
  final bool? isMobile;
  @override
  final String? adresCity;
  @override
  final bool? isSubs;
  @override
  final bool? authEnd;
  @override
  final double? averageRating;
  @override
  final BuiltList<String>? likedCategory;
  @override
  final bool? adressSelected;
  @override
  final bool? walkIns;
  @override
  final BuiltList<DocumentReference<Object?>>? linkFavCategories;
  @override
  final int? sredOcenka;
  @override
  final String? serviceType;
  @override
  final bool? isAdmin;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.photos,
      this.wishlistPhotos,
      this.userType,
      this.adresMap,
      this.adreText,
      this.linkPost,
      this.linkPricelist,
      this.isSalon,
      this.category,
      this.followers,
      this.following,
      this.rating,
      this.role,
      this.inst,
      this.facebook,
      this.whats,
      this.isMobile,
      this.adresCity,
      this.isSubs,
      this.authEnd,
      this.averageRating,
      this.likedCategory,
      this.adressSelected,
      this.walkIns,
      this.linkFavCategories,
      this.sredOcenka,
      this.serviceType,
      this.isAdmin,
      this.status,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        photos == other.photos &&
        wishlistPhotos == other.wishlistPhotos &&
        userType == other.userType &&
        adresMap == other.adresMap &&
        adreText == other.adreText &&
        linkPost == other.linkPost &&
        linkPricelist == other.linkPricelist &&
        isSalon == other.isSalon &&
        category == other.category &&
        followers == other.followers &&
        following == other.following &&
        rating == other.rating &&
        role == other.role &&
        inst == other.inst &&
        facebook == other.facebook &&
        whats == other.whats &&
        isMobile == other.isMobile &&
        adresCity == other.adresCity &&
        isSubs == other.isSubs &&
        authEnd == other.authEnd &&
        averageRating == other.averageRating &&
        likedCategory == other.likedCategory &&
        adressSelected == other.adressSelected &&
        walkIns == other.walkIns &&
        linkFavCategories == other.linkFavCategories &&
        sredOcenka == other.sredOcenka &&
        serviceType == other.serviceType &&
        isAdmin == other.isAdmin &&
        status == other.status &&
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
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, email.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode), createdTime.hashCode), phoneNumber.hashCode), photos.hashCode), wishlistPhotos.hashCode), userType.hashCode), adresMap.hashCode), adreText.hashCode), linkPost.hashCode), linkPricelist.hashCode), isSalon.hashCode), category.hashCode), followers.hashCode), following.hashCode),
                                                                                rating.hashCode),
                                                                            role.hashCode),
                                                                        inst.hashCode),
                                                                    facebook.hashCode),
                                                                whats.hashCode),
                                                            isMobile.hashCode),
                                                        adresCity.hashCode),
                                                    isSubs.hashCode),
                                                authEnd.hashCode),
                                            averageRating.hashCode),
                                        likedCategory.hashCode),
                                    adressSelected.hashCode),
                                walkIns.hashCode),
                            linkFavCategories.hashCode),
                        sredOcenka.hashCode),
                    serviceType.hashCode),
                isAdmin.hashCode),
            status.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('photos', photos)
          ..add('wishlistPhotos', wishlistPhotos)
          ..add('userType', userType)
          ..add('adresMap', adresMap)
          ..add('adreText', adreText)
          ..add('linkPost', linkPost)
          ..add('linkPricelist', linkPricelist)
          ..add('isSalon', isSalon)
          ..add('category', category)
          ..add('followers', followers)
          ..add('following', following)
          ..add('rating', rating)
          ..add('role', role)
          ..add('inst', inst)
          ..add('facebook', facebook)
          ..add('whats', whats)
          ..add('isMobile', isMobile)
          ..add('adresCity', adresCity)
          ..add('isSubs', isSubs)
          ..add('authEnd', authEnd)
          ..add('averageRating', averageRating)
          ..add('likedCategory', likedCategory)
          ..add('adressSelected', adressSelected)
          ..add('walkIns', walkIns)
          ..add('linkFavCategories', linkFavCategories)
          ..add('sredOcenka', sredOcenka)
          ..add('serviceType', serviceType)
          ..add('isAdmin', isAdmin)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  ListBuilder<String>? _photos;
  ListBuilder<String> get photos =>
      _$this._photos ??= new ListBuilder<String>();
  set photos(ListBuilder<String>? photos) => _$this._photos = photos;

  ListBuilder<String>? _wishlistPhotos;
  ListBuilder<String> get wishlistPhotos =>
      _$this._wishlistPhotos ??= new ListBuilder<String>();
  set wishlistPhotos(ListBuilder<String>? wishlistPhotos) =>
      _$this._wishlistPhotos = wishlistPhotos;

  String? _userType;
  String? get userType => _$this._userType;
  set userType(String? userType) => _$this._userType = userType;

  LatLng? _adresMap;
  LatLng? get adresMap => _$this._adresMap;
  set adresMap(LatLng? adresMap) => _$this._adresMap = adresMap;

  String? _adreText;
  String? get adreText => _$this._adreText;
  set adreText(String? adreText) => _$this._adreText = adreText;

  ListBuilder<DocumentReference<Object?>>? _linkPost;
  ListBuilder<DocumentReference<Object?>> get linkPost =>
      _$this._linkPost ??= new ListBuilder<DocumentReference<Object?>>();
  set linkPost(ListBuilder<DocumentReference<Object?>>? linkPost) =>
      _$this._linkPost = linkPost;

  ListBuilder<DocumentReference<Object?>>? _linkPricelist;
  ListBuilder<DocumentReference<Object?>> get linkPricelist =>
      _$this._linkPricelist ??= new ListBuilder<DocumentReference<Object?>>();
  set linkPricelist(ListBuilder<DocumentReference<Object?>>? linkPricelist) =>
      _$this._linkPricelist = linkPricelist;

  bool? _isSalon;
  bool? get isSalon => _$this._isSalon;
  set isSalon(bool? isSalon) => _$this._isSalon = isSalon;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  ListBuilder<DocumentReference<Object?>>? _followers;
  ListBuilder<DocumentReference<Object?>> get followers =>
      _$this._followers ??= new ListBuilder<DocumentReference<Object?>>();
  set followers(ListBuilder<DocumentReference<Object?>>? followers) =>
      _$this._followers = followers;

  ListBuilder<DocumentReference<Object?>>? _following;
  ListBuilder<DocumentReference<Object?>> get following =>
      _$this._following ??= new ListBuilder<DocumentReference<Object?>>();
  set following(ListBuilder<DocumentReference<Object?>>? following) =>
      _$this._following = following;

  ListBuilder<double>? _rating;
  ListBuilder<double> get rating =>
      _$this._rating ??= new ListBuilder<double>();
  set rating(ListBuilder<double>? rating) => _$this._rating = rating;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _inst;
  String? get inst => _$this._inst;
  set inst(String? inst) => _$this._inst = inst;

  String? _facebook;
  String? get facebook => _$this._facebook;
  set facebook(String? facebook) => _$this._facebook = facebook;

  String? _whats;
  String? get whats => _$this._whats;
  set whats(String? whats) => _$this._whats = whats;

  bool? _isMobile;
  bool? get isMobile => _$this._isMobile;
  set isMobile(bool? isMobile) => _$this._isMobile = isMobile;

  String? _adresCity;
  String? get adresCity => _$this._adresCity;
  set adresCity(String? adresCity) => _$this._adresCity = adresCity;

  bool? _isSubs;
  bool? get isSubs => _$this._isSubs;
  set isSubs(bool? isSubs) => _$this._isSubs = isSubs;

  bool? _authEnd;
  bool? get authEnd => _$this._authEnd;
  set authEnd(bool? authEnd) => _$this._authEnd = authEnd;

  double? _averageRating;
  double? get averageRating => _$this._averageRating;
  set averageRating(double? averageRating) =>
      _$this._averageRating = averageRating;

  ListBuilder<String>? _likedCategory;
  ListBuilder<String> get likedCategory =>
      _$this._likedCategory ??= new ListBuilder<String>();
  set likedCategory(ListBuilder<String>? likedCategory) =>
      _$this._likedCategory = likedCategory;

  bool? _adressSelected;
  bool? get adressSelected => _$this._adressSelected;
  set adressSelected(bool? adressSelected) =>
      _$this._adressSelected = adressSelected;

  bool? _walkIns;
  bool? get walkIns => _$this._walkIns;
  set walkIns(bool? walkIns) => _$this._walkIns = walkIns;

  ListBuilder<DocumentReference<Object?>>? _linkFavCategories;
  ListBuilder<DocumentReference<Object?>> get linkFavCategories =>
      _$this._linkFavCategories ??=
          new ListBuilder<DocumentReference<Object?>>();
  set linkFavCategories(
          ListBuilder<DocumentReference<Object?>>? linkFavCategories) =>
      _$this._linkFavCategories = linkFavCategories;

  int? _sredOcenka;
  int? get sredOcenka => _$this._sredOcenka;
  set sredOcenka(int? sredOcenka) => _$this._sredOcenka = sredOcenka;

  String? _serviceType;
  String? get serviceType => _$this._serviceType;
  set serviceType(String? serviceType) => _$this._serviceType = serviceType;

  bool? _isAdmin;
  bool? get isAdmin => _$this._isAdmin;
  set isAdmin(bool? isAdmin) => _$this._isAdmin = isAdmin;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _photos = $v.photos?.toBuilder();
      _wishlistPhotos = $v.wishlistPhotos?.toBuilder();
      _userType = $v.userType;
      _adresMap = $v.adresMap;
      _adreText = $v.adreText;
      _linkPost = $v.linkPost?.toBuilder();
      _linkPricelist = $v.linkPricelist?.toBuilder();
      _isSalon = $v.isSalon;
      _category = $v.category;
      _followers = $v.followers?.toBuilder();
      _following = $v.following?.toBuilder();
      _rating = $v.rating?.toBuilder();
      _role = $v.role;
      _inst = $v.inst;
      _facebook = $v.facebook;
      _whats = $v.whats;
      _isMobile = $v.isMobile;
      _adresCity = $v.adresCity;
      _isSubs = $v.isSubs;
      _authEnd = $v.authEnd;
      _averageRating = $v.averageRating;
      _likedCategory = $v.likedCategory?.toBuilder();
      _adressSelected = $v.adressSelected;
      _walkIns = $v.walkIns;
      _linkFavCategories = $v.linkFavCategories?.toBuilder();
      _sredOcenka = $v.sredOcenka;
      _serviceType = $v.serviceType;
      _isAdmin = $v.isAdmin;
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              photos: _photos?.build(),
              wishlistPhotos: _wishlistPhotos?.build(),
              userType: userType,
              adresMap: adresMap,
              adreText: adreText,
              linkPost: _linkPost?.build(),
              linkPricelist: _linkPricelist?.build(),
              isSalon: isSalon,
              category: category,
              followers: _followers?.build(),
              following: _following?.build(),
              rating: _rating?.build(),
              role: role,
              inst: inst,
              facebook: facebook,
              whats: whats,
              isMobile: isMobile,
              adresCity: adresCity,
              isSubs: isSubs,
              authEnd: authEnd,
              averageRating: averageRating,
              likedCategory: _likedCategory?.build(),
              adressSelected: adressSelected,
              walkIns: walkIns,
              linkFavCategories: _linkFavCategories?.build(),
              sredOcenka: sredOcenka,
              serviceType: serviceType,
              isAdmin: isAdmin,
              status: status,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'photos';
        _photos?.build();
        _$failedField = 'wishlistPhotos';
        _wishlistPhotos?.build();

        _$failedField = 'linkPost';
        _linkPost?.build();
        _$failedField = 'linkPricelist';
        _linkPricelist?.build();

        _$failedField = 'followers';
        _followers?.build();
        _$failedField = 'following';
        _following?.build();
        _$failedField = 'rating';
        _rating?.build();

        _$failedField = 'likedCategory';
        _likedCategory?.build();

        _$failedField = 'linkFavCategories';
        _linkFavCategories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
