import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  String? get name;

  BuiltList<String>? get image;

  @BuiltValueField(wireName: 'Liked_by')
  BuiltList<DocumentReference>? get likedBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'first_photo')
  String? get firstPhoto;

  String? get category;

  bool? get isBusiness;

  LatLng? get location;

  @BuiltValueField(wireName: 'link_category')
  DocumentReference? get linkCategory;

  @BuiltValueField(wireName: 'walk_ins')
  bool? get walkIns;

  BuiltList<DocumentReference>? get following;

  @BuiltValueField(wireName: 'video_reels')
  String? get videoReels;

  String? get description;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..name = ''
    ..image = ListBuilder()
    ..likedBy = ListBuilder()
    ..firstPhoto = ''
    ..category = ''
    ..isBusiness = false
    ..walkIns = false
    ..following = ListBuilder()
    ..videoReels = ''
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostsRecordData({
  String? name,
  DateTime? createdAt,
  DocumentReference? createdBy,
  String? firstPhoto,
  String? category,
  bool? isBusiness,
  LatLng? location,
  DocumentReference? linkCategory,
  bool? walkIns,
  String? videoReels,
  String? description,
}) {
  final firestoreData = serializers.toFirestore(
    PostsRecord.serializer,
    PostsRecord(
      (p) => p
        ..name = name
        ..image = null
        ..likedBy = null
        ..createdAt = createdAt
        ..createdBy = createdBy
        ..firstPhoto = firstPhoto
        ..category = category
        ..isBusiness = isBusiness
        ..location = location
        ..linkCategory = linkCategory
        ..walkIns = walkIns
        ..following = null
        ..videoReels = videoReels
        ..description = description,
    ),
  );

  return firestoreData;
}
