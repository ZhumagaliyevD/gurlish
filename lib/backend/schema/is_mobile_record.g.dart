// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_mobile_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IsMobileRecord> _$isMobileRecordSerializer =
    new _$IsMobileRecordSerializer();

class _$IsMobileRecordSerializer
    implements StructuredSerializer<IsMobileRecord> {
  @override
  final Iterable<Type> types = const [IsMobileRecord, _$IsMobileRecord];
  @override
  final String wireName = 'IsMobileRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, IsMobileRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.ismobile;
    if (value != null) {
      result
        ..add('ismobile')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  IsMobileRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IsMobileRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ismobile':
          result.ismobile = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$IsMobileRecord extends IsMobileRecord {
  @override
  final bool? ismobile;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IsMobileRecord([void Function(IsMobileRecordBuilder)? updates]) =>
      (new IsMobileRecordBuilder()..update(updates))._build();

  _$IsMobileRecord._({this.ismobile, this.ffRef}) : super._();

  @override
  IsMobileRecord rebuild(void Function(IsMobileRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IsMobileRecordBuilder toBuilder() =>
      new IsMobileRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IsMobileRecord &&
        ismobile == other.ismobile &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, ismobile.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IsMobileRecord')
          ..add('ismobile', ismobile)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IsMobileRecordBuilder
    implements Builder<IsMobileRecord, IsMobileRecordBuilder> {
  _$IsMobileRecord? _$v;

  bool? _ismobile;
  bool? get ismobile => _$this._ismobile;
  set ismobile(bool? ismobile) => _$this._ismobile = ismobile;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IsMobileRecordBuilder() {
    IsMobileRecord._initializeBuilder(this);
  }

  IsMobileRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ismobile = $v.ismobile;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IsMobileRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IsMobileRecord;
  }

  @override
  void update(void Function(IsMobileRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IsMobileRecord build() => _build();

  _$IsMobileRecord _build() {
    final _$result =
        _$v ?? new _$IsMobileRecord._(ismobile: ismobile, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
