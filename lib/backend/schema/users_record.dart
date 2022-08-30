import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  BuiltList<String>? get photos;

  @BuiltValueField(wireName: 'wishlist_photos')
  BuiltList<String>? get wishlistPhotos;

  @BuiltValueField(wireName: 'user_type')
  String? get userType;

  @BuiltValueField(wireName: 'adres_map')
  LatLng? get adresMap;

  @BuiltValueField(wireName: 'adre_text')
  String? get adreText;

  @BuiltValueField(wireName: 'link_post')
  BuiltList<DocumentReference>? get linkPost;

  @BuiltValueField(wireName: 'link_pricelist')
  BuiltList<DocumentReference>? get linkPricelist;

  bool? get isSalon;

  String? get category;

  @BuiltValueField(wireName: 'Followers')
  BuiltList<DocumentReference>? get followers;

  BuiltList<DocumentReference>? get following;

  BuiltList<double>? get rating;

  String? get role;

  String? get inst;

  String? get facebook;

  String? get whats;

  bool? get isMobile;

  @BuiltValueField(wireName: 'adres_city')
  String? get adresCity;

  bool? get isSubs;

  @BuiltValueField(wireName: 'auth_end')
  bool? get authEnd;

  double? get averageRating;

  BuiltList<String>? get likedCategory;

  bool? get adressSelected;

  @BuiltValueField(wireName: 'walk_ins')
  bool? get walkIns;

  @BuiltValueField(wireName: 'link_fav_categories')
  BuiltList<DocumentReference>? get linkFavCategories;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..photos = ListBuilder()
    ..wishlistPhotos = ListBuilder()
    ..userType = ''
    ..adreText = ''
    ..linkPost = ListBuilder()
    ..linkPricelist = ListBuilder()
    ..isSalon = false
    ..category = ''
    ..followers = ListBuilder()
    ..following = ListBuilder()
    ..rating = ListBuilder()
    ..role = ''
    ..inst = ''
    ..facebook = ''
    ..whats = ''
    ..isMobile = false
    ..adresCity = ''
    ..isSubs = false
    ..authEnd = false
    ..averageRating = 0.0
    ..likedCategory = ListBuilder()
    ..adressSelected = false
    ..walkIns = false
    ..linkFavCategories = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userType,
  LatLng? adresMap,
  String? adreText,
  bool? isSalon,
  String? category,
  String? role,
  String? inst,
  String? facebook,
  String? whats,
  bool? isMobile,
  String? adresCity,
  bool? isSubs,
  bool? authEnd,
  double? averageRating,
  bool? adressSelected,
  bool? walkIns,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..photos = null
        ..wishlistPhotos = null
        ..userType = userType
        ..adresMap = adresMap
        ..adreText = adreText
        ..linkPost = null
        ..linkPricelist = null
        ..isSalon = isSalon
        ..category = category
        ..followers = null
        ..following = null
        ..rating = null
        ..role = role
        ..inst = inst
        ..facebook = facebook
        ..whats = whats
        ..isMobile = isMobile
        ..adresCity = adresCity
        ..isSubs = isSubs
        ..authEnd = authEnd
        ..averageRating = averageRating
        ..likedCategory = null
        ..adressSelected = adressSelected
        ..walkIns = walkIns
        ..linkFavCategories = null,
    ),
  );

  return firestoreData;
}
