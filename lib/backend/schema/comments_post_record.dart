import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_post_record.g.dart';

abstract class CommentsPostRecord
    implements Built<CommentsPostRecord, CommentsPostRecordBuilder> {
  static Serializer<CommentsPostRecord> get serializer =>
      _$commentsPostRecordSerializer;

  String? get text;

  String? get img;

  double? get rating;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CommentsPostRecordBuilder builder) => builder
    ..text = ''
    ..img = ''
    ..rating = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('commentsPost')
          : FirebaseFirestore.instance.collectionGroup('commentsPost');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('commentsPost').doc();

  static Stream<CommentsPostRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommentsPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommentsPostRecord._();
  factory CommentsPostRecord(
          [void Function(CommentsPostRecordBuilder) updates]) =
      _$CommentsPostRecord;

  static CommentsPostRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommentsPostRecordData({
  String? text,
  String? img,
  double? rating,
  DocumentReference? createdBy,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    CommentsPostRecord.serializer,
    CommentsPostRecord(
      (c) => c
        ..text = text
        ..img = img
        ..rating = rating
        ..createdBy = createdBy
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
