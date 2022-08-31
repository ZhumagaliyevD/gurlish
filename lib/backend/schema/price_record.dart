import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'price_record.g.dart';

abstract class PriceRecord implements Built<PriceRecord, PriceRecordBuilder> {
  static Serializer<PriceRecord> get serializer => _$priceRecordSerializer;

  int? get price;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PriceRecordBuilder builder) =>
      builder..price = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('price');

  static Stream<PriceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PriceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PriceRecord._();
  factory PriceRecord([void Function(PriceRecordBuilder) updates]) =
      _$PriceRecord;

  static PriceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPriceRecordData({
  int? price,
}) {
  final firestoreData = serializers.toFirestore(
    PriceRecord.serializer,
    PriceRecord(
      (p) => p..price = price,
    ),
  );

  return firestoreData;
}
