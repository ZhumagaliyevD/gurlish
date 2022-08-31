// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PriceRecord> _$priceRecordSerializer = new _$PriceRecordSerializer();

class _$PriceRecordSerializer implements StructuredSerializer<PriceRecord> {
  @override
  final Iterable<Type> types = const [PriceRecord, _$PriceRecord];
  @override
  final String wireName = 'PriceRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PriceRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  PriceRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PriceRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$PriceRecord extends PriceRecord {
  @override
  final int? price;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PriceRecord([void Function(PriceRecordBuilder)? updates]) =>
      (new PriceRecordBuilder()..update(updates))._build();

  _$PriceRecord._({this.price, this.ffRef}) : super._();

  @override
  PriceRecord rebuild(void Function(PriceRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PriceRecordBuilder toBuilder() => new PriceRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PriceRecord && price == other.price && ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, price.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PriceRecord')
          ..add('price', price)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PriceRecordBuilder implements Builder<PriceRecord, PriceRecordBuilder> {
  _$PriceRecord? _$v;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PriceRecordBuilder() {
    PriceRecord._initializeBuilder(this);
  }

  PriceRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _price = $v.price;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PriceRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PriceRecord;
  }

  @override
  void update(void Function(PriceRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PriceRecord build() => _build();

  _$PriceRecord _build() {
    final _$result = _$v ?? new _$PriceRecord._(price: price, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
