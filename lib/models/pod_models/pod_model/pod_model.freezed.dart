// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pod_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PODModel _$PODModelFromJson(Map<String, dynamic> json) {
  return _PODModel.fromJson(json);
}

/// @nodoc
mixin _$PODModel {
  PODData get data => throw _privateConstructorUsedError;

  /// Serializes this PODModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PODModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PODModelCopyWith<PODModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PODModelCopyWith<$Res> {
  factory $PODModelCopyWith(PODModel value, $Res Function(PODModel) then) =
      _$PODModelCopyWithImpl<$Res, PODModel>;
  @useResult
  $Res call({PODData data});

  $PODDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PODModelCopyWithImpl<$Res, $Val extends PODModel>
    implements $PODModelCopyWith<$Res> {
  _$PODModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PODModel
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
              as PODData,
    ) as $Val);
  }

  /// Create a copy of PODModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PODDataCopyWith<$Res> get data {
    return $PODDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PODModelImplCopyWith<$Res>
    implements $PODModelCopyWith<$Res> {
  factory _$$PODModelImplCopyWith(
          _$PODModelImpl value, $Res Function(_$PODModelImpl) then) =
      __$$PODModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PODData data});

  @override
  $PODDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PODModelImplCopyWithImpl<$Res>
    extends _$PODModelCopyWithImpl<$Res, _$PODModelImpl>
    implements _$$PODModelImplCopyWith<$Res> {
  __$$PODModelImplCopyWithImpl(
      _$PODModelImpl _value, $Res Function(_$PODModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PODModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PODModelImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PODData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PODModelImpl implements _PODModel {
  const _$PODModelImpl({required this.data});

  factory _$PODModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PODModelImplFromJson(json);

  @override
  final PODData data;

  @override
  String toString() {
    return 'PODModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PODModelImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of PODModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PODModelImplCopyWith<_$PODModelImpl> get copyWith =>
      __$$PODModelImplCopyWithImpl<_$PODModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PODModelImplToJson(
      this,
    );
  }
}

abstract class _PODModel implements PODModel {
  const factory _PODModel({required final PODData data}) = _$PODModelImpl;

  factory _PODModel.fromJson(Map<String, dynamic> json) =
      _$PODModelImpl.fromJson;

  @override
  PODData get data;

  /// Create a copy of PODModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PODModelImplCopyWith<_$PODModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PODData _$PODDataFromJson(Map<String, dynamic> json) {
  return _PODData.fromJson(json);
}

/// @nodoc
mixin _$PODData {
  Category get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_category')
  String get subCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_category1')
  String get subCategory1 => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_description')
  String get productDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_description')
  String get shortDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_price')
  String get oldPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_price')
  String get newPrice => throw _privateConstructorUsedError;
  List<ColorModel>? get colors => throw _privateConstructorUsedError;
  List<SizeModel>? get size => throw _privateConstructorUsedError;
  List<dynamic>? get ratings => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this PODData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PODData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PODDataCopyWith<PODData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PODDataCopyWith<$Res> {
  factory $PODDataCopyWith(PODData value, $Res Function(PODData) then) =
      _$PODDataCopyWithImpl<$Res, PODData>;
  @useResult
  $Res call(
      {Category category,
      @JsonKey(name: 'sub_category') String subCategory,
      @JsonKey(name: 'sub_category1') String subCategory1,
      String title,
      List<String>? images,
      String thumbnail,
      @JsonKey(name: 'product_description') String productDescription,
      @JsonKey(name: 'short_description') String shortDescription,
      @JsonKey(name: 'old_price') String oldPrice,
      @JsonKey(name: 'new_price') String newPrice,
      List<ColorModel>? colors,
      List<SizeModel>? size,
      List<dynamic>? ratings,
      @JsonKey(name: 'id') String id});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$PODDataCopyWithImpl<$Res, $Val extends PODData>
    implements $PODDataCopyWith<$Res> {
  _$PODDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PODData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? subCategory = null,
    Object? subCategory1 = null,
    Object? title = null,
    Object? images = freezed,
    Object? thumbnail = null,
    Object? productDescription = null,
    Object? shortDescription = null,
    Object? oldPrice = null,
    Object? newPrice = null,
    Object? colors = freezed,
    Object? size = freezed,
    Object? ratings = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory1: null == subCategory1
          ? _value.subCategory1
          : subCategory1 // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      productDescription: null == productDescription
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      oldPrice: null == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as String,
      newPrice: null == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as String,
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as List<SizeModel>?,
      ratings: freezed == ratings
          ? _value.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of PODData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PODDataImplCopyWith<$Res> implements $PODDataCopyWith<$Res> {
  factory _$$PODDataImplCopyWith(
          _$PODDataImpl value, $Res Function(_$PODDataImpl) then) =
      __$$PODDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Category category,
      @JsonKey(name: 'sub_category') String subCategory,
      @JsonKey(name: 'sub_category1') String subCategory1,
      String title,
      List<String>? images,
      String thumbnail,
      @JsonKey(name: 'product_description') String productDescription,
      @JsonKey(name: 'short_description') String shortDescription,
      @JsonKey(name: 'old_price') String oldPrice,
      @JsonKey(name: 'new_price') String newPrice,
      List<ColorModel>? colors,
      List<SizeModel>? size,
      List<dynamic>? ratings,
      @JsonKey(name: 'id') String id});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$PODDataImplCopyWithImpl<$Res>
    extends _$PODDataCopyWithImpl<$Res, _$PODDataImpl>
    implements _$$PODDataImplCopyWith<$Res> {
  __$$PODDataImplCopyWithImpl(
      _$PODDataImpl _value, $Res Function(_$PODDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PODData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? subCategory = null,
    Object? subCategory1 = null,
    Object? title = null,
    Object? images = freezed,
    Object? thumbnail = null,
    Object? productDescription = null,
    Object? shortDescription = null,
    Object? oldPrice = null,
    Object? newPrice = null,
    Object? colors = freezed,
    Object? size = freezed,
    Object? ratings = freezed,
    Object? id = null,
  }) {
    return _then(_$PODDataImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory1: null == subCategory1
          ? _value.subCategory1
          : subCategory1 // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      productDescription: null == productDescription
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      oldPrice: null == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as String,
      newPrice: null == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as String,
      colors: freezed == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ColorModel>?,
      size: freezed == size
          ? _value._size
          : size // ignore: cast_nullable_to_non_nullable
              as List<SizeModel>?,
      ratings: freezed == ratings
          ? _value._ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PODDataImpl implements _PODData {
  const _$PODDataImpl(
      {required this.category,
      @JsonKey(name: 'sub_category') required this.subCategory,
      @JsonKey(name: 'sub_category1') required this.subCategory1,
      required this.title,
      final List<String>? images,
      required this.thumbnail,
      @JsonKey(name: 'product_description') required this.productDescription,
      @JsonKey(name: 'short_description') required this.shortDescription,
      @JsonKey(name: 'old_price') required this.oldPrice,
      @JsonKey(name: 'new_price') required this.newPrice,
      final List<ColorModel>? colors,
      final List<SizeModel>? size,
      final List<dynamic>? ratings,
      @JsonKey(name: 'id') required this.id})
      : _images = images,
        _colors = colors,
        _size = size,
        _ratings = ratings;

  factory _$PODDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PODDataImplFromJson(json);

  @override
  final Category category;
  @override
  @JsonKey(name: 'sub_category')
  final String subCategory;
  @override
  @JsonKey(name: 'sub_category1')
  final String subCategory1;
  @override
  final String title;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String thumbnail;
  @override
  @JsonKey(name: 'product_description')
  final String productDescription;
  @override
  @JsonKey(name: 'short_description')
  final String shortDescription;
  @override
  @JsonKey(name: 'old_price')
  final String oldPrice;
  @override
  @JsonKey(name: 'new_price')
  final String newPrice;
  final List<ColorModel>? _colors;
  @override
  List<ColorModel>? get colors {
    final value = _colors;
    if (value == null) return null;
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SizeModel>? _size;
  @override
  List<SizeModel>? get size {
    final value = _size;
    if (value == null) return null;
    if (_size is EqualUnmodifiableListView) return _size;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _ratings;
  @override
  List<dynamic>? get ratings {
    final value = _ratings;
    if (value == null) return null;
    if (_ratings is EqualUnmodifiableListView) return _ratings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  String toString() {
    return 'PODData(category: $category, subCategory: $subCategory, subCategory1: $subCategory1, title: $title, images: $images, thumbnail: $thumbnail, productDescription: $productDescription, shortDescription: $shortDescription, oldPrice: $oldPrice, newPrice: $newPrice, colors: $colors, size: $size, ratings: $ratings, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PODDataImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.subCategory1, subCategory1) ||
                other.subCategory1 == subCategory1) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.productDescription, productDescription) ||
                other.productDescription == productDescription) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice) &&
            (identical(other.newPrice, newPrice) ||
                other.newPrice == newPrice) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            const DeepCollectionEquality().equals(other._size, _size) &&
            const DeepCollectionEquality().equals(other._ratings, _ratings) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      subCategory,
      subCategory1,
      title,
      const DeepCollectionEquality().hash(_images),
      thumbnail,
      productDescription,
      shortDescription,
      oldPrice,
      newPrice,
      const DeepCollectionEquality().hash(_colors),
      const DeepCollectionEquality().hash(_size),
      const DeepCollectionEquality().hash(_ratings),
      id);

  /// Create a copy of PODData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PODDataImplCopyWith<_$PODDataImpl> get copyWith =>
      __$$PODDataImplCopyWithImpl<_$PODDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PODDataImplToJson(
      this,
    );
  }
}

abstract class _PODData implements PODData {
  const factory _PODData(
      {required final Category category,
      @JsonKey(name: 'sub_category') required final String subCategory,
      @JsonKey(name: 'sub_category1') required final String subCategory1,
      required final String title,
      final List<String>? images,
      required final String thumbnail,
      @JsonKey(name: 'product_description')
      required final String productDescription,
      @JsonKey(name: 'short_description')
      required final String shortDescription,
      @JsonKey(name: 'old_price') required final String oldPrice,
      @JsonKey(name: 'new_price') required final String newPrice,
      final List<ColorModel>? colors,
      final List<SizeModel>? size,
      final List<dynamic>? ratings,
      @JsonKey(name: 'id') required final String id}) = _$PODDataImpl;

  factory _PODData.fromJson(Map<String, dynamic> json) = _$PODDataImpl.fromJson;

  @override
  Category get category;
  @override
  @JsonKey(name: 'sub_category')
  String get subCategory;
  @override
  @JsonKey(name: 'sub_category1')
  String get subCategory1;
  @override
  String get title;
  @override
  List<String>? get images;
  @override
  String get thumbnail;
  @override
  @JsonKey(name: 'product_description')
  String get productDescription;
  @override
  @JsonKey(name: 'short_description')
  String get shortDescription;
  @override
  @JsonKey(name: 'old_price')
  String get oldPrice;
  @override
  @JsonKey(name: 'new_price')
  String get newPrice;
  @override
  List<ColorModel>? get colors;
  @override
  List<SizeModel>? get size;
  @override
  List<dynamic>? get ratings;
  @override
  @JsonKey(name: 'id')
  String get id;

  /// Create a copy of PODData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PODDataImplCopyWith<_$PODDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  @JsonKey(name: 'cat_name')
  String get catName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cat_img')
  String get catImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cat_name') String catName,
      @JsonKey(name: 'cat_img') String catImg,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catName = null,
    Object? catImg = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      catName: null == catName
          ? _value.catName
          : catName // ignore: cast_nullable_to_non_nullable
              as String,
      catImg: null == catImg
          ? _value.catImg
          : catImg // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cat_name') String catName,
      @JsonKey(name: 'cat_img') String catImg,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catName = null,
    Object? catImg = null,
    Object? id = null,
  }) {
    return _then(_$CategoryImpl(
      catName: null == catName
          ? _value.catName
          : catName // ignore: cast_nullable_to_non_nullable
              as String,
      catImg: null == catImg
          ? _value.catImg
          : catImg // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {@JsonKey(name: 'cat_name') required this.catName,
      @JsonKey(name: 'cat_img') required this.catImg,
      @JsonKey(name: 'id') required this.id});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  @JsonKey(name: 'cat_name')
  final String catName;
  @override
  @JsonKey(name: 'cat_img')
  final String catImg;
  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  String toString() {
    return 'Category(catName: $catName, catImg: $catImg, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.catName, catName) || other.catName == catName) &&
            (identical(other.catImg, catImg) || other.catImg == catImg) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, catName, catImg, id);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {@JsonKey(name: 'cat_name') required final String catName,
      @JsonKey(name: 'cat_img') required final String catImg,
      @JsonKey(name: 'id') required final String id}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  @JsonKey(name: 'cat_name')
  String get catName;
  @override
  @JsonKey(name: 'cat_img')
  String get catImg;
  @override
  @JsonKey(name: 'id')
  String get id;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ColorModel _$ColorModelFromJson(Map<String, dynamic> json) {
  return _ColorModel.fromJson(json);
}

/// @nodoc
mixin _$ColorModel {
  @JsonKey(name: 'colorName')
  String get colorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'colorCode')
  String get colorCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this ColorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorModelCopyWith<ColorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorModelCopyWith<$Res> {
  factory $ColorModelCopyWith(
          ColorModel value, $Res Function(ColorModel) then) =
      _$ColorModelCopyWithImpl<$Res, ColorModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'colorName') String colorName,
      @JsonKey(name: 'colorCode') String colorCode,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class _$ColorModelCopyWithImpl<$Res, $Val extends ColorModel>
    implements $ColorModelCopyWith<$Res> {
  _$ColorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorName = null,
    Object? colorCode = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      colorName: null == colorName
          ? _value.colorName
          : colorName // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorModelImplCopyWith<$Res>
    implements $ColorModelCopyWith<$Res> {
  factory _$$ColorModelImplCopyWith(
          _$ColorModelImpl value, $Res Function(_$ColorModelImpl) then) =
      __$$ColorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'colorName') String colorName,
      @JsonKey(name: 'colorCode') String colorCode,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class __$$ColorModelImplCopyWithImpl<$Res>
    extends _$ColorModelCopyWithImpl<$Res, _$ColorModelImpl>
    implements _$$ColorModelImplCopyWith<$Res> {
  __$$ColorModelImplCopyWithImpl(
      _$ColorModelImpl _value, $Res Function(_$ColorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorName = null,
    Object? colorCode = null,
    Object? id = null,
  }) {
    return _then(_$ColorModelImpl(
      colorName: null == colorName
          ? _value.colorName
          : colorName // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorModelImpl implements _ColorModel {
  const _$ColorModelImpl(
      {@JsonKey(name: 'colorName') required this.colorName,
      @JsonKey(name: 'colorCode') required this.colorCode,
      @JsonKey(name: 'id') required this.id});

  factory _$ColorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorModelImplFromJson(json);

  @override
  @JsonKey(name: 'colorName')
  final String colorName;
  @override
  @JsonKey(name: 'colorCode')
  final String colorCode;
  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  String toString() {
    return 'ColorModel(colorName: $colorName, colorCode: $colorCode, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorModelImpl &&
            (identical(other.colorName, colorName) ||
                other.colorName == colorName) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, colorName, colorCode, id);

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorModelImplCopyWith<_$ColorModelImpl> get copyWith =>
      __$$ColorModelImplCopyWithImpl<_$ColorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorModelImplToJson(
      this,
    );
  }
}

abstract class _ColorModel implements ColorModel {
  const factory _ColorModel(
      {@JsonKey(name: 'colorName') required final String colorName,
      @JsonKey(name: 'colorCode') required final String colorCode,
      @JsonKey(name: 'id') required final String id}) = _$ColorModelImpl;

  factory _ColorModel.fromJson(Map<String, dynamic> json) =
      _$ColorModelImpl.fromJson;

  @override
  @JsonKey(name: 'colorName')
  String get colorName;
  @override
  @JsonKey(name: 'colorCode')
  String get colorCode;
  @override
  @JsonKey(name: 'id')
  String get id;

  /// Create a copy of ColorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorModelImplCopyWith<_$ColorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SizeModel _$SizeModelFromJson(Map<String, dynamic> json) {
  return _SizeModel.fromJson(json);
}

/// @nodoc
mixin _$SizeModel {
  SizeDetail get size => throw _privateConstructorUsedError;
  List<String>? get media => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this SizeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SizeModelCopyWith<SizeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SizeModelCopyWith<$Res> {
  factory $SizeModelCopyWith(SizeModel value, $Res Function(SizeModel) then) =
      _$SizeModelCopyWithImpl<$Res, SizeModel>;
  @useResult
  $Res call(
      {SizeDetail size,
      List<String>? media,
      String price,
      String title,
      @JsonKey(name: '_id') String id});

  $SizeDetailCopyWith<$Res> get size;
}

/// @nodoc
class _$SizeModelCopyWithImpl<$Res, $Val extends SizeModel>
    implements $SizeModelCopyWith<$Res> {
  _$SizeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? media = freezed,
    Object? price = null,
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as SizeDetail,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SizeDetailCopyWith<$Res> get size {
    return $SizeDetailCopyWith<$Res>(_value.size, (value) {
      return _then(_value.copyWith(size: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SizeModelImplCopyWith<$Res>
    implements $SizeModelCopyWith<$Res> {
  factory _$$SizeModelImplCopyWith(
          _$SizeModelImpl value, $Res Function(_$SizeModelImpl) then) =
      __$$SizeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SizeDetail size,
      List<String>? media,
      String price,
      String title,
      @JsonKey(name: '_id') String id});

  @override
  $SizeDetailCopyWith<$Res> get size;
}

/// @nodoc
class __$$SizeModelImplCopyWithImpl<$Res>
    extends _$SizeModelCopyWithImpl<$Res, _$SizeModelImpl>
    implements _$$SizeModelImplCopyWith<$Res> {
  __$$SizeModelImplCopyWithImpl(
      _$SizeModelImpl _value, $Res Function(_$SizeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? media = freezed,
    Object? price = null,
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_$SizeModelImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as SizeDetail,
      media: freezed == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SizeModelImpl implements _SizeModel {
  const _$SizeModelImpl(
      {required this.size,
      final List<String>? media,
      required this.price,
      required this.title,
      @JsonKey(name: '_id') required this.id})
      : _media = media;

  factory _$SizeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SizeModelImplFromJson(json);

  @override
  final SizeDetail size;
  final List<String>? _media;
  @override
  List<String>? get media {
    final value = _media;
    if (value == null) return null;
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String price;
  @override
  final String title;
  @override
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString() {
    return 'SizeModel(size: $size, media: $media, price: $price, title: $title, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SizeModelImpl &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size,
      const DeepCollectionEquality().hash(_media), price, title, id);

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SizeModelImplCopyWith<_$SizeModelImpl> get copyWith =>
      __$$SizeModelImplCopyWithImpl<_$SizeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SizeModelImplToJson(
      this,
    );
  }
}

abstract class _SizeModel implements SizeModel {
  const factory _SizeModel(
      {required final SizeDetail size,
      final List<String>? media,
      required final String price,
      required final String title,
      @JsonKey(name: '_id') required final String id}) = _$SizeModelImpl;

  factory _SizeModel.fromJson(Map<String, dynamic> json) =
      _$SizeModelImpl.fromJson;

  @override
  SizeDetail get size;
  @override
  List<String>? get media;
  @override
  String get price;
  @override
  String get title;
  @override
  @JsonKey(name: '_id')
  String get id;

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SizeModelImplCopyWith<_$SizeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SizeDetail _$SizeDetailFromJson(Map<String, dynamic> json) {
  return _SizeDetail.fromJson(json);
}

/// @nodoc
mixin _$SizeDetail {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this SizeDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SizeDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SizeDetailCopyWith<SizeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SizeDetailCopyWith<$Res> {
  factory $SizeDetailCopyWith(
          SizeDetail value, $Res Function(SizeDetail) then) =
      _$SizeDetailCopyWithImpl<$Res, SizeDetail>;
  @useResult
  $Res call({String name, @JsonKey(name: 'id') String id});
}

/// @nodoc
class _$SizeDetailCopyWithImpl<$Res, $Val extends SizeDetail>
    implements $SizeDetailCopyWith<$Res> {
  _$SizeDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SizeDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SizeDetailImplCopyWith<$Res>
    implements $SizeDetailCopyWith<$Res> {
  factory _$$SizeDetailImplCopyWith(
          _$SizeDetailImpl value, $Res Function(_$SizeDetailImpl) then) =
      __$$SizeDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'id') String id});
}

/// @nodoc
class __$$SizeDetailImplCopyWithImpl<$Res>
    extends _$SizeDetailCopyWithImpl<$Res, _$SizeDetailImpl>
    implements _$$SizeDetailImplCopyWith<$Res> {
  __$$SizeDetailImplCopyWithImpl(
      _$SizeDetailImpl _value, $Res Function(_$SizeDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SizeDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$SizeDetailImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SizeDetailImpl implements _SizeDetail {
  const _$SizeDetailImpl(
      {required this.name, @JsonKey(name: 'id') required this.id});

  factory _$SizeDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SizeDetailImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  String toString() {
    return 'SizeDetail(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SizeDetailImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  /// Create a copy of SizeDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SizeDetailImplCopyWith<_$SizeDetailImpl> get copyWith =>
      __$$SizeDetailImplCopyWithImpl<_$SizeDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SizeDetailImplToJson(
      this,
    );
  }
}

abstract class _SizeDetail implements SizeDetail {
  const factory _SizeDetail(
      {required final String name,
      @JsonKey(name: 'id') required final String id}) = _$SizeDetailImpl;

  factory _SizeDetail.fromJson(Map<String, dynamic> json) =
      _$SizeDetailImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'id')
  String get id;

  /// Create a copy of SizeDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SizeDetailImplCopyWith<_$SizeDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
