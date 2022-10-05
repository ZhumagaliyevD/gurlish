// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricelist_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PricelistRecord> _$pricelistRecordSerializer =
    new _$PricelistRecordSerializer();

class _$PricelistRecordSerializer
    implements StructuredSerializer<PricelistRecord> {
  @override
  final Iterable<Type> types = const [PricelistRecord, _$PricelistRecord];
  @override
  final String wireName = 'PricelistRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PricelistRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PricelistRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PricelistRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PricelistRecord extends PricelistRecord {
  @override
  final String? name;
  @override
  final int? price;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final String? category;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PricelistRecord([void Function(PricelistRecordBuilder)? updates]) =>
      (new PricelistRecordBuilder()..update(updates))._build();

  _$PricelistRecord._(
      {this.name, this.price, this.createdBy, this.category, this.ffRef})
      : super._();

  @override
  PricelistRecord rebuild(void Function(PricelistRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PricelistRecordBuilder toBuilder() =>
      new PricelistRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PricelistRecord &&
        name == other.name &&
        price == other.price &&
        createdBy == other.createdBy &&
        category == other.category &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), price.hashCode), createdBy.hashCode),
            category.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PricelistRecord')
          ..add('name', name)
          ..add('price', price)
          ..add('createdBy', createdBy)
          ..add('category', category)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PricelistRecordBuilder
    implements Builder<PricelistRecord, PricelistRecordBuilder> {
  _$PricelistRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PricelistRecordBuilder() {
    PricelistRecord._initializeBuilder(this);
  }

  PricelistRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _price = $v.price;
      _createdBy = $v.createdBy;
      _category = $v.category;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PricelistRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PricelistRecord;
  }

  @override
  void update(void Function(PricelistRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PricelistRecord build() => _build();

  _$PricelistRecord _build() {
    final _$result = _$v ??
        new _$PricelistRecord._(
            name: name,
            price: price,
            createdBy: createdBy,
            category: category,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
