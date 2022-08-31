import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_stories_record.g.dart';

abstract class CommentsStoriesRecord
    implements Built<CommentsStoriesRecord, CommentsStoriesRecordBuilder> {
  static Serializer<CommentsStoriesRecord> get serializer =>
      _$commentsStoriesRecordSerializer;

  String? get text;

  double? get rating;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CommentsStoriesRecordBuilder builder) =>
      builder
        ..text = ''
        ..rating = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('commentsStories')
          : FirebaseFirestore.instance.collectionGroup('commentsStories');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('commentsStories').doc();

  static Stream<CommentsStoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommentsStoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommentsStoriesRecord._();
  factory CommentsStoriesRecord(
          [void Function(CommentsStoriesRecordBuilder) updates]) =
      _$CommentsStoriesRecord;

  static CommentsStoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommentsStoriesRecordData({
  String? text,
  double? rating,
  DocumentReference? createdBy,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    CommentsStoriesRecord.serializer,
    CommentsStoriesRecord(
      (c) => c
        ..text = text
        ..rating = rating
        ..createdBy = createdBy
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
