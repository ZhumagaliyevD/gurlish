import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'is_mobile_record.g.dart';

abstract class IsMobileRecord
    implements Built<IsMobileRecord, IsMobileRecordBuilder> {
  static Serializer<IsMobileRecord> get serializer =>
      _$isMobileRecordSerializer;

  bool? get ismobile;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IsMobileRecordBuilder builder) =>
      builder..ismobile = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('is_mobile');

  static Stream<IsMobileRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IsMobileRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IsMobileRecord._();
  factory IsMobileRecord([void Function(IsMobileRecordBuilder) updates]) =
      _$IsMobileRecord;

  static IsMobileRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIsMobileRecordData({
  bool? ismobile,
}) {
  final firestoreData = serializers.toFirestore(
    IsMobileRecord.serializer,
    IsMobileRecord(
      (i) => i..ismobile = ismobile,
    ),
  );

  return firestoreData;
}
