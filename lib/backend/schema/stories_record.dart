import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stories_record.g.dart';

abstract class StoriesRecord
    implements Built<StoriesRecord, StoriesRecordBuilder> {
  static Serializer<StoriesRecord> get serializer => _$storiesRecordSerializer;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  String? get name;

  @BuiltValueField(wireName: 'Created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'img_stories')
  String? get imgStories;

  String? get category;

  BuiltList<DocumentReference>? get categories;

  @BuiltValueField(wireName: 'StoriesID')
  String? get storiesID;

  BuiltList<double>? get rating;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StoriesRecordBuilder builder) => builder
    ..name = ''
    ..imgStories = ''
    ..category = ''
    ..categories = ListBuilder()
    ..storiesID = ''
    ..rating = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StoriesRecord._();
  factory StoriesRecord([void Function(StoriesRecordBuilder) updates]) =
      _$StoriesRecord;

  static StoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStoriesRecordData({
  DocumentReference? createdBy,
  String? name,
  DateTime? createdAt,
  String? imgStories,
  String? category,
  String? storiesID,
}) {
  final firestoreData = serializers.toFirestore(
    StoriesRecord.serializer,
    StoriesRecord(
      (s) => s
        ..createdBy = createdBy
        ..name = name
        ..createdAt = createdAt
        ..imgStories = imgStories
        ..category = category
        ..categories = null
        ..storiesID = storiesID
        ..rating = null,
    ),
  );

  return firestoreData;
}
