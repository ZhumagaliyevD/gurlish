import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'product_record.g.dart';

abstract class ProductRecord
    implements Built<ProductRecord, ProductRecordBuilder> {
  static Serializer<ProductRecord> get serializer => _$productRecordSerializer;

  String? get name;

  String? get img;

  @BuiltValueField(wireName: 'create_at')
  DateTime? get createAt;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  String? get category;

  @BuiltValueField(wireName: 'link_category')
  DocumentReference? get linkCategory;

  String? get text;

  int? get price;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductRecordBuilder builder) => builder
    ..name = ''
    ..img = ''
    ..category = ''
    ..text = ''
    ..price = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductRecord._();
  factory ProductRecord([void Function(ProductRecordBuilder) updates]) =
      _$ProductRecord;

  static ProductRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductRecordData({
  String? name,
  String? img,
  DateTime? createAt,
  DocumentReference? createdBy,
  String? category,
  DocumentReference? linkCategory,
  String? text,
  int? price,
}) {
  final firestoreData = serializers.toFirestore(
    ProductRecord.serializer,
    ProductRecord(
      (p) => p
        ..name = name
        ..img = img
        ..createAt = createAt
        ..createdBy = createdBy
        ..category = category
        ..linkCategory = linkCategory
        ..text = text
        ..price = price,
    ),
  );

  return firestoreData;
}
