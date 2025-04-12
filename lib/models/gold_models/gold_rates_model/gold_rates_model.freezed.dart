// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gold_rates_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RatesResponse _$RatesResponseFromJson(Map<String, dynamic> json) {
  return _RatesResponse.fromJson(json);
}

/// @nodoc
mixin _$RatesResponse {
  RatesResult? get result => throw _privateConstructorUsedError;

  /// Serializes this RatesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatesResponseCopyWith<RatesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesResponseCopyWith<$Res> {
  factory $RatesResponseCopyWith(
          RatesResponse value, $Res Function(RatesResponse) then) =
      _$RatesResponseCopyWithImpl<$Res, RatesResponse>;
  @useResult
  $Res call({RatesResult? result});

  $RatesResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$RatesResponseCopyWithImpl<$Res, $Val extends RatesResponse>
    implements $RatesResponseCopyWith<$Res> {
  _$RatesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as RatesResult?,
    ) as $Val);
  }

  /// Create a copy of RatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RatesResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $RatesResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RatesResponseImplCopyWith<$Res>
    implements $RatesResponseCopyWith<$Res> {
  factory _$$RatesResponseImplCopyWith(
          _$RatesResponseImpl value, $Res Function(_$RatesResponseImpl) then) =
      __$$RatesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RatesResult? result});

  @override
  $RatesResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$RatesResponseImplCopyWithImpl<$Res>
    extends _$RatesResponseCopyWithImpl<$Res, _$RatesResponseImpl>
    implements _$$RatesResponseImplCopyWith<$Res> {
  __$$RatesResponseImplCopyWithImpl(
      _$RatesResponseImpl _value, $Res Function(_$RatesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$RatesResponseImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as RatesResult?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatesResponseImpl implements _RatesResponse {
  _$RatesResponseImpl({this.result});

  factory _$RatesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatesResponseImplFromJson(json);

  @override
  final RatesResult? result;

  @override
  String toString() {
    return 'RatesResponse(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatesResponseImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of RatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatesResponseImplCopyWith<_$RatesResponseImpl> get copyWith =>
      __$$RatesResponseImplCopyWithImpl<_$RatesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatesResponseImplToJson(
      this,
    );
  }
}

abstract class _RatesResponse implements RatesResponse {
  factory _RatesResponse({final RatesResult? result}) = _$RatesResponseImpl;

  factory _RatesResponse.fromJson(Map<String, dynamic> json) =
      _$RatesResponseImpl.fromJson;

  @override
  RatesResult? get result;

  /// Create a copy of RatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatesResponseImplCopyWith<_$RatesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatesResult _$RatesResultFromJson(Map<String, dynamic> json) {
  return _RatesResult.fromJson(json);
}

/// @nodoc
mixin _$RatesResult {
  RatesData? get data => throw _privateConstructorUsedError;

  /// Serializes this RatesResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatesResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatesResultCopyWith<RatesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesResultCopyWith<$Res> {
  factory $RatesResultCopyWith(
          RatesResult value, $Res Function(RatesResult) then) =
      _$RatesResultCopyWithImpl<$Res, RatesResult>;
  @useResult
  $Res call({RatesData? data});

  $RatesDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$RatesResultCopyWithImpl<$Res, $Val extends RatesResult>
    implements $RatesResultCopyWith<$Res> {
  _$RatesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatesResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RatesData?,
    ) as $Val);
  }

  /// Create a copy of RatesResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RatesDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RatesDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RatesResultImplCopyWith<$Res>
    implements $RatesResultCopyWith<$Res> {
  factory _$$RatesResultImplCopyWith(
          _$RatesResultImpl value, $Res Function(_$RatesResultImpl) then) =
      __$$RatesResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RatesData? data});

  @override
  $RatesDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RatesResultImplCopyWithImpl<$Res>
    extends _$RatesResultCopyWithImpl<$Res, _$RatesResultImpl>
    implements _$$RatesResultImplCopyWith<$Res> {
  __$$RatesResultImplCopyWithImpl(
      _$RatesResultImpl _value, $Res Function(_$RatesResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatesResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RatesResultImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RatesData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatesResultImpl implements _RatesResult {
  _$RatesResultImpl({this.data});

  factory _$RatesResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatesResultImplFromJson(json);

  @override
  final RatesData? data;

  @override
  String toString() {
    return 'RatesResult(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatesResultImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of RatesResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatesResultImplCopyWith<_$RatesResultImpl> get copyWith =>
      __$$RatesResultImplCopyWithImpl<_$RatesResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatesResultImplToJson(
      this,
    );
  }
}

abstract class _RatesResult implements RatesResult {
  factory _RatesResult({final RatesData? data}) = _$RatesResultImpl;

  factory _RatesResult.fromJson(Map<String, dynamic> json) =
      _$RatesResultImpl.fromJson;

  @override
  RatesData? get data;

  /// Create a copy of RatesResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatesResultImplCopyWith<_$RatesResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RatesData _$RatesDataFromJson(Map<String, dynamic> json) {
  return _RatesData.fromJson(json);
}

/// @nodoc
mixin _$RatesData {
  Rates? get rates => throw _privateConstructorUsedError;
  List<Tax>? get taxes => throw _privateConstructorUsedError;
  String? get blockId => throw _privateConstructorUsedError;

  /// Serializes this RatesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatesDataCopyWith<RatesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesDataCopyWith<$Res> {
  factory $RatesDataCopyWith(RatesData value, $Res Function(RatesData) then) =
      _$RatesDataCopyWithImpl<$Res, RatesData>;
  @useResult
  $Res call({Rates? rates, List<Tax>? taxes, String? blockId});

  $RatesCopyWith<$Res>? get rates;
}

/// @nodoc
class _$RatesDataCopyWithImpl<$Res, $Val extends RatesData>
    implements $RatesDataCopyWith<$Res> {
  _$RatesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rates = freezed,
    Object? taxes = freezed,
    Object? blockId = freezed,
  }) {
    return _then(_value.copyWith(
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Rates?,
      taxes: freezed == taxes
          ? _value.taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as List<Tax>?,
      blockId: freezed == blockId
          ? _value.blockId
          : blockId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of RatesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RatesCopyWith<$Res>? get rates {
    if (_value.rates == null) {
      return null;
    }

    return $RatesCopyWith<$Res>(_value.rates!, (value) {
      return _then(_value.copyWith(rates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RatesDataImplCopyWith<$Res>
    implements $RatesDataCopyWith<$Res> {
  factory _$$RatesDataImplCopyWith(
          _$RatesDataImpl value, $Res Function(_$RatesDataImpl) then) =
      __$$RatesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Rates? rates, List<Tax>? taxes, String? blockId});

  @override
  $RatesCopyWith<$Res>? get rates;
}

/// @nodoc
class __$$RatesDataImplCopyWithImpl<$Res>
    extends _$RatesDataCopyWithImpl<$Res, _$RatesDataImpl>
    implements _$$RatesDataImplCopyWith<$Res> {
  __$$RatesDataImplCopyWithImpl(
      _$RatesDataImpl _value, $Res Function(_$RatesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rates = freezed,
    Object? taxes = freezed,
    Object? blockId = freezed,
  }) {
    return _then(_$RatesDataImpl(
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Rates?,
      taxes: freezed == taxes
          ? _value._taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as List<Tax>?,
      blockId: freezed == blockId
          ? _value.blockId
          : blockId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatesDataImpl implements _RatesData {
  _$RatesDataImpl({this.rates, final List<Tax>? taxes, this.blockId})
      : _taxes = taxes;

  factory _$RatesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatesDataImplFromJson(json);

  @override
  final Rates? rates;
  final List<Tax>? _taxes;
  @override
  List<Tax>? get taxes {
    final value = _taxes;
    if (value == null) return null;
    if (_taxes is EqualUnmodifiableListView) return _taxes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? blockId;

  @override
  String toString() {
    return 'RatesData(rates: $rates, taxes: $taxes, blockId: $blockId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatesDataImpl &&
            (identical(other.rates, rates) || other.rates == rates) &&
            const DeepCollectionEquality().equals(other._taxes, _taxes) &&
            (identical(other.blockId, blockId) || other.blockId == blockId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, rates, const DeepCollectionEquality().hash(_taxes), blockId);

  /// Create a copy of RatesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatesDataImplCopyWith<_$RatesDataImpl> get copyWith =>
      __$$RatesDataImplCopyWithImpl<_$RatesDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatesDataImplToJson(
      this,
    );
  }
}

abstract class _RatesData implements RatesData {
  factory _RatesData(
      {final Rates? rates,
      final List<Tax>? taxes,
      final String? blockId}) = _$RatesDataImpl;

  factory _RatesData.fromJson(Map<String, dynamic> json) =
      _$RatesDataImpl.fromJson;

  @override
  Rates? get rates;
  @override
  List<Tax>? get taxes;
  @override
  String? get blockId;

  /// Create a copy of RatesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatesDataImplCopyWith<_$RatesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Rates _$RatesFromJson(Map<String, dynamic> json) {
  return _Rates.fromJson(json);
}

/// @nodoc
mixin _$Rates {
  String? get gBuy => throw _privateConstructorUsedError;
  String? get gSell => throw _privateConstructorUsedError;
  String? get sBuy => throw _privateConstructorUsedError;
  String? get sSell => throw _privateConstructorUsedError;
  String? get gBuyGst => throw _privateConstructorUsedError;
  String? get sBuyGst => throw _privateConstructorUsedError;

  /// Serializes this Rates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatesCopyWith<Rates> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesCopyWith<$Res> {
  factory $RatesCopyWith(Rates value, $Res Function(Rates) then) =
      _$RatesCopyWithImpl<$Res, Rates>;
  @useResult
  $Res call(
      {String? gBuy,
      String? gSell,
      String? sBuy,
      String? sSell,
      String? gBuyGst,
      String? sBuyGst});
}

/// @nodoc
class _$RatesCopyWithImpl<$Res, $Val extends Rates>
    implements $RatesCopyWith<$Res> {
  _$RatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gBuy = freezed,
    Object? gSell = freezed,
    Object? sBuy = freezed,
    Object? sSell = freezed,
    Object? gBuyGst = freezed,
    Object? sBuyGst = freezed,
  }) {
    return _then(_value.copyWith(
      gBuy: freezed == gBuy
          ? _value.gBuy
          : gBuy // ignore: cast_nullable_to_non_nullable
              as String?,
      gSell: freezed == gSell
          ? _value.gSell
          : gSell // ignore: cast_nullable_to_non_nullable
              as String?,
      sBuy: freezed == sBuy
          ? _value.sBuy
          : sBuy // ignore: cast_nullable_to_non_nullable
              as String?,
      sSell: freezed == sSell
          ? _value.sSell
          : sSell // ignore: cast_nullable_to_non_nullable
              as String?,
      gBuyGst: freezed == gBuyGst
          ? _value.gBuyGst
          : gBuyGst // ignore: cast_nullable_to_non_nullable
              as String?,
      sBuyGst: freezed == sBuyGst
          ? _value.sBuyGst
          : sBuyGst // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatesImplCopyWith<$Res> implements $RatesCopyWith<$Res> {
  factory _$$RatesImplCopyWith(
          _$RatesImpl value, $Res Function(_$RatesImpl) then) =
      __$$RatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? gBuy,
      String? gSell,
      String? sBuy,
      String? sSell,
      String? gBuyGst,
      String? sBuyGst});
}

/// @nodoc
class __$$RatesImplCopyWithImpl<$Res>
    extends _$RatesCopyWithImpl<$Res, _$RatesImpl>
    implements _$$RatesImplCopyWith<$Res> {
  __$$RatesImplCopyWithImpl(
      _$RatesImpl _value, $Res Function(_$RatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gBuy = freezed,
    Object? gSell = freezed,
    Object? sBuy = freezed,
    Object? sSell = freezed,
    Object? gBuyGst = freezed,
    Object? sBuyGst = freezed,
  }) {
    return _then(_$RatesImpl(
      gBuy: freezed == gBuy
          ? _value.gBuy
          : gBuy // ignore: cast_nullable_to_non_nullable
              as String?,
      gSell: freezed == gSell
          ? _value.gSell
          : gSell // ignore: cast_nullable_to_non_nullable
              as String?,
      sBuy: freezed == sBuy
          ? _value.sBuy
          : sBuy // ignore: cast_nullable_to_non_nullable
              as String?,
      sSell: freezed == sSell
          ? _value.sSell
          : sSell // ignore: cast_nullable_to_non_nullable
              as String?,
      gBuyGst: freezed == gBuyGst
          ? _value.gBuyGst
          : gBuyGst // ignore: cast_nullable_to_non_nullable
              as String?,
      sBuyGst: freezed == sBuyGst
          ? _value.sBuyGst
          : sBuyGst // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatesImpl implements _Rates {
  _$RatesImpl(
      {this.gBuy,
      this.gSell,
      this.sBuy,
      this.sSell,
      this.gBuyGst,
      this.sBuyGst});

  factory _$RatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatesImplFromJson(json);

  @override
  final String? gBuy;
  @override
  final String? gSell;
  @override
  final String? sBuy;
  @override
  final String? sSell;
  @override
  final String? gBuyGst;
  @override
  final String? sBuyGst;

  @override
  String toString() {
    return 'Rates(gBuy: $gBuy, gSell: $gSell, sBuy: $sBuy, sSell: $sSell, gBuyGst: $gBuyGst, sBuyGst: $sBuyGst)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatesImpl &&
            (identical(other.gBuy, gBuy) || other.gBuy == gBuy) &&
            (identical(other.gSell, gSell) || other.gSell == gSell) &&
            (identical(other.sBuy, sBuy) || other.sBuy == sBuy) &&
            (identical(other.sSell, sSell) || other.sSell == sSell) &&
            (identical(other.gBuyGst, gBuyGst) || other.gBuyGst == gBuyGst) &&
            (identical(other.sBuyGst, sBuyGst) || other.sBuyGst == sBuyGst));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gBuy, gSell, sBuy, sSell, gBuyGst, sBuyGst);

  /// Create a copy of Rates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatesImplCopyWith<_$RatesImpl> get copyWith =>
      __$$RatesImplCopyWithImpl<_$RatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatesImplToJson(
      this,
    );
  }
}

abstract class _Rates implements Rates {
  factory _Rates(
      {final String? gBuy,
      final String? gSell,
      final String? sBuy,
      final String? sSell,
      final String? gBuyGst,
      final String? sBuyGst}) = _$RatesImpl;

  factory _Rates.fromJson(Map<String, dynamic> json) = _$RatesImpl.fromJson;

  @override
  String? get gBuy;
  @override
  String? get gSell;
  @override
  String? get sBuy;
  @override
  String? get sSell;
  @override
  String? get gBuyGst;
  @override
  String? get sBuyGst;

  /// Create a copy of Rates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatesImplCopyWith<_$RatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tax _$TaxFromJson(Map<String, dynamic> json) {
  return _Tax.fromJson(json);
}

/// @nodoc
mixin _$Tax {
  String? get type => throw _privateConstructorUsedError;
  String? get taxPerc => throw _privateConstructorUsedError;

  /// Serializes this Tax to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tax
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxCopyWith<Tax> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxCopyWith<$Res> {
  factory $TaxCopyWith(Tax value, $Res Function(Tax) then) =
      _$TaxCopyWithImpl<$Res, Tax>;
  @useResult
  $Res call({String? type, String? taxPerc});
}

/// @nodoc
class _$TaxCopyWithImpl<$Res, $Val extends Tax> implements $TaxCopyWith<$Res> {
  _$TaxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tax
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? taxPerc = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      taxPerc: freezed == taxPerc
          ? _value.taxPerc
          : taxPerc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxImplCopyWith<$Res> implements $TaxCopyWith<$Res> {
  factory _$$TaxImplCopyWith(_$TaxImpl value, $Res Function(_$TaxImpl) then) =
      __$$TaxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String? taxPerc});
}

/// @nodoc
class __$$TaxImplCopyWithImpl<$Res> extends _$TaxCopyWithImpl<$Res, _$TaxImpl>
    implements _$$TaxImplCopyWith<$Res> {
  __$$TaxImplCopyWithImpl(_$TaxImpl _value, $Res Function(_$TaxImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tax
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? taxPerc = freezed,
  }) {
    return _then(_$TaxImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      taxPerc: freezed == taxPerc
          ? _value.taxPerc
          : taxPerc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxImpl implements _Tax {
  _$TaxImpl({this.type, this.taxPerc});

  factory _$TaxImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxImplFromJson(json);

  @override
  final String? type;
  @override
  final String? taxPerc;

  @override
  String toString() {
    return 'Tax(type: $type, taxPerc: $taxPerc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.taxPerc, taxPerc) || other.taxPerc == taxPerc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, taxPerc);

  /// Create a copy of Tax
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxImplCopyWith<_$TaxImpl> get copyWith =>
      __$$TaxImplCopyWithImpl<_$TaxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxImplToJson(
      this,
    );
  }
}

abstract class _Tax implements Tax {
  factory _Tax({final String? type, final String? taxPerc}) = _$TaxImpl;

  factory _Tax.fromJson(Map<String, dynamic> json) = _$TaxImpl.fromJson;

  @override
  String? get type;
  @override
  String? get taxPerc;

  /// Create a copy of Tax
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxImplCopyWith<_$TaxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
