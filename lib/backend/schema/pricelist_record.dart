import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pricelist_record.g.dart';

abstract class PricelistRecord
    implements Built<PricelistRecord, PricelistRecordBuilder> {
  static Serializer<PricelistRecord> get serializer =>
      _$pricelistRecordSerializer;

  String? get name;

  int? get price;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  String? get category;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PricelistRecordBuilder builder) => builder
    ..name = ''
    ..price = 0
    ..category = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pricelist');

  static Stream<PricelistRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PricelistRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PricelistRecord._();
  factory PricelistRecord([void Function(PricelistRecordBuilder) updates]) =
      _$PricelistRecord;

  static PricelistRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPricelistRecordData({
  String? name,
  int? price,
  DocumentReference? createdBy,
  String? category,
}) {
  final firestoreData = serializers.toFirestore(
    PricelistRecord.serializer,
    PricelistRecord(
      (p) => p
        ..name = name
        ..price = price
        ..createdBy = createdBy
        ..category = category,
    ),
  );

  return firestoreData;
}
