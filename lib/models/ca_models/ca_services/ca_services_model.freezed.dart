// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ca_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CAServicesModel _$CAServicesModelFromJson(Map<String, dynamic> json) {
  return _CAServicesModel.fromJson(json);
}

/// @nodoc
mixin _$CAServicesModel {
  CAServicesData get data => throw _privateConstructorUsedError;

  /// Serializes this CAServicesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CAServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CAServicesModelCopyWith<CAServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CAServicesModelCopyWith<$Res> {
  factory $CAServicesModelCopyWith(
          CAServicesModel value, $Res Function(CAServicesModel) then) =
      _$CAServicesModelCopyWithImpl<$Res, CAServicesModel>;
  @useResult
  $Res call({CAServicesData data});

  $CAServicesDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CAServicesModelCopyWithImpl<$Res, $Val extends CAServicesModel>
    implements $CAServicesModelCopyWith<$Res> {
  _$CAServicesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CAServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CAServicesData,
    ) as $Val);
  }

  /// Create a copy of CAServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CAServicesDataCopyWith<$Res> get data {
    return $CAServicesDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CAServicesModelImplCopyWith<$Res>
    implements $CAServicesModelCopyWith<$Res> {
  factory _$$CAServicesModelImplCopyWith(_$CAServicesModelImpl value,
          $Res Function(_$CAServicesModelImpl) then) =
      __$$CAServicesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CAServicesData data});

  @override
  $CAServicesDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$CAServicesModelImplCopyWithImpl<$Res>
    extends _$CAServicesModelCopyWithImpl<$Res, _$CAServicesModelImpl>
    implements _$$CAServicesModelImplCopyWith<$Res> {
  __$$CAServicesModelImplCopyWithImpl(
      _$CAServicesModelImpl _value, $Res Function(_$CAServicesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CAServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CAServicesModelImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CAServicesData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CAServicesModelImpl implements _CAServicesModel {
  _$CAServicesModelImpl({required this.data});

  factory _$CAServicesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CAServicesModelImplFromJson(json);

  @override
  final CAServicesData data;

  @override
  String toString() {
    return 'CAServicesModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CAServicesModelImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CAServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CAServicesModelImplCopyWith<_$CAServicesModelImpl> get copyWith =>
      __$$CAServicesModelImplCopyWithImpl<_$CAServicesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CAServicesModelImplToJson(
      this,
    );
  }
}

abstract class _CAServicesModel implements CAServicesModel {
  factory _CAServicesModel({required final CAServicesData data}) =
      _$CAServicesModelImpl;

  factory _CAServicesModel.fromJson(Map<String, dynamic> json) =
      _$CAServicesModelImpl.fromJson;

  @override
  CAServicesData get data;

  /// Create a copy of CAServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CAServicesModelImplCopyWith<_$CAServicesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CAServicesData _$CAServicesDataFromJson(Map<String, dynamic> json) {
  return _CAServicesData.fromJson(json);
}

/// @nodoc
mixin _$CAServicesData {
  String get title => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: "cross_price")
  String get crossPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "category_id")
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_category")
  String get subCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "sub2_category")
  String get sub2CategoryId => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<String> get banners => throw _privateConstructorUsedError;
  List<String> get benefits => throw _privateConstructorUsedError;

  /// Serializes this CAServicesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CAServicesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CAServicesDataCopyWith<CAServicesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CAServicesDataCopyWith<$Res> {
  factory $CAServicesDataCopyWith(
          CAServicesData value, $Res Function(CAServicesData) then) =
      _$CAServicesDataCopyWithImpl<$Res, CAServicesData>;
  @useResult
  $Res call(
      {String title,
      String price,
      @JsonKey(name: "cross_price") String crossPrice,
      @JsonKey(name: "category_id") String categoryId,
      @JsonKey(name: "sub_category") String subCategoryId,
      @JsonKey(name: "sub2_category") String sub2CategoryId,
      String logo,
      String id,
      List<String> banners,
      List<String> benefits});
}

/// @nodoc
class _$CAServicesDataCopyWithImpl<$Res, $Val extends CAServicesData>
    implements $CAServicesDataCopyWith<$Res> {
  _$CAServicesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CAServicesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? crossPrice = null,
    Object? categoryId = null,
    Object? subCategoryId = null,
    Object? sub2CategoryId = null,
    Object? logo = null,
    Object? id = null,
    Object? banners = null,
    Object? benefits = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      crossPrice: null == crossPrice
          ? _value.crossPrice
          : crossPrice // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoryId: null == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      sub2CategoryId: null == sub2CategoryId
          ? _value.sub2CategoryId
          : sub2CategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      benefits: null == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CAServicesDataImplCopyWith<$Res>
    implements $CAServicesDataCopyWith<$Res> {
  factory _$$CAServicesDataImplCopyWith(_$CAServicesDataImpl value,
          $Res Function(_$CAServicesDataImpl) then) =
      __$$CAServicesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String price,
      @JsonKey(name: "cross_price") String crossPrice,
      @JsonKey(name: "category_id") String categoryId,
      @JsonKey(name: "sub_category") String subCategoryId,
      @JsonKey(name: "sub2_category") String sub2CategoryId,
      String logo,
      String id,
      List<String> banners,
      List<String> benefits});
}

/// @nodoc
class __$$CAServicesDataImplCopyWithImpl<$Res>
    extends _$CAServicesDataCopyWithImpl<$Res, _$CAServicesDataImpl>
    implements _$$CAServicesDataImplCopyWith<$Res> {
  __$$CAServicesDataImplCopyWithImpl(
      _$CAServicesDataImpl _value, $Res Function(_$CAServicesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CAServicesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? crossPrice = null,
    Object? categoryId = null,
    Object? subCategoryId = null,
    Object? sub2CategoryId = null,
    Object? logo = null,
    Object? id = null,
    Object? banners = null,
    Object? benefits = null,
  }) {
    return _then(_$CAServicesDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      crossPrice: null == crossPrice
          ? _value.crossPrice
          : crossPrice // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoryId: null == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      sub2CategoryId: null == sub2CategoryId
          ? _value.sub2CategoryId
          : sub2CategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<String>,
      benefits: null == benefits
          ? _value._benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CAServicesDataImpl implements _CAServicesData {
  const _$CAServicesDataImpl(
      {this.title = "",
      this.price = "",
      @JsonKey(name: "cross_price") this.crossPrice = "",
      @JsonKey(name: "category_id") this.categoryId = "",
      @JsonKey(name: "sub_category") this.subCategoryId = "",
      @JsonKey(name: "sub2_category") this.sub2CategoryId = "",
      this.logo = "",
      this.id = "",
      final List<String> banners = const [],
      final List<String> benefits = const []})
      : _banners = banners,
        _benefits = benefits;

  factory _$CAServicesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CAServicesDataImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey(name: "cross_price")
  final String crossPrice;
  @override
  @JsonKey(name: "category_id")
  final String categoryId;
  @override
  @JsonKey(name: "sub_category")
  final String subCategoryId;
  @override
  @JsonKey(name: "sub2_category")
  final String sub2CategoryId;
  @override
  @JsonKey()
  final String logo;
  @override
  @JsonKey()
  final String id;
  final List<String> _banners;
  @override
  @JsonKey()
  List<String> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  final List<String> _benefits;
  @override
  @JsonKey()
  List<String> get benefits {
    if (_benefits is EqualUnmodifiableListView) return _benefits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_benefits);
  }

  @override
  String toString() {
    return 'CAServicesData(title: $title, price: $price, crossPrice: $crossPrice, categoryId: $categoryId, subCategoryId: $subCategoryId, sub2CategoryId: $sub2CategoryId, logo: $logo, id: $id, banners: $banners, benefits: $benefits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CAServicesDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.crossPrice, crossPrice) ||
                other.crossPrice == crossPrice) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.subCategoryId, subCategoryId) ||
                other.subCategoryId == subCategoryId) &&
            (identical(other.sub2CategoryId, sub2CategoryId) ||
                other.sub2CategoryId == sub2CategoryId) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality().equals(other._benefits, _benefits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      price,
      crossPrice,
      categoryId,
      subCategoryId,
      sub2CategoryId,
      logo,
      id,
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_benefits));

  /// Create a copy of CAServicesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CAServicesDataImplCopyWith<_$CAServicesDataImpl> get copyWith =>
      __$$CAServicesDataImplCopyWithImpl<_$CAServicesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CAServicesDataImplToJson(
      this,
    );
  }
}

abstract class _CAServicesData implements CAServicesData {
  const factory _CAServicesData(
      {final String title,
      final String price,
      @JsonKey(name: "cross_price") final String crossPrice,
      @JsonKey(name: "category_id") final String categoryId,
      @JsonKey(name: "sub_category") final String subCategoryId,
      @JsonKey(name: "sub2_category") final String sub2CategoryId,
      final String logo,
      final String id,
      final List<String> banners,
      final List<String> benefits}) = _$CAServicesDataImpl;

  factory _CAServicesData.fromJson(Map<String, dynamic> json) =
      _$CAServicesDataImpl.fromJson;

  @override
  String get title;
  @override
  String get price;
  @override
  @JsonKey(name: "cross_price")
  String get crossPrice;
  @override
  @JsonKey(name: "category_id")
  String get categoryId;
  @override
  @JsonKey(name: "sub_category")
  String get subCategoryId;
  @override
  @JsonKey(name: "sub2_category")
  String get sub2CategoryId;
  @override
  String get logo;
  @override
  String get id;
  @override
  List<String> get banners;
  @override
  List<String> get benefits;

  /// Create a copy of CAServicesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CAServicesDataImplCopyWith<_$CAServicesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
