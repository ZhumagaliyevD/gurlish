import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'category_salon_record.g.dart';

abstract class CategorySalonRecord
    implements Built<CategorySalonRecord, CategorySalonRecordBuilder> {
  static Serializer<CategorySalonRecord> get serializer =>
      _$categorySalonRecordSerializer;

  String? get name;

  String? get image;

  @BuiltValueField(wireName: 'link_salon')
  BuiltList<DocumentReference>? get linkSalon;

  @BuiltValueField(wireName: 'link_stories')
  BuiltList<DocumentReference>? get linkStories;

  @BuiltValueField(wireName: 'count_stories')
  int? get countStories;

  @BuiltValueField(wireName: 'created_user_link')
  BuiltList<DocumentReference>? get createdUserLink;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategorySalonRecordBuilder builder) => builder
    ..name = ''
    ..image = ''
    ..linkSalon = ListBuilder()
    ..linkStories = ListBuilder()
    ..countStories = 0
    ..createdUserLink = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category_salon');

  static Stream<CategorySalonRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategorySalonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CategorySalonRecord._();
  factory CategorySalonRecord(
          [void Function(CategorySalonRecordBuilder) updates]) =
      _$CategorySalonRecord;

  static CategorySalonRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategorySalonRecordData({
  String? name,
  String? image,
  int? countStories,
}) {
  final firestoreData = serializers.toFirestore(
    CategorySalonRecord.serializer,
    CategorySalonRecord(
      (c) => c
        ..name = name
        ..image = image
        ..linkSalon = null
        ..linkStories = null
        ..countStories = countStories
        ..createdUserLink = null,
    ),
  );

  return firestoreData;
}
