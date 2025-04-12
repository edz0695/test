// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gold_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoldCartModel _$GoldCartModelFromJson(Map<String, dynamic> json) {
  return _GoldCartModel.fromJson(json);
}

/// @nodoc
mixin _$GoldCartModel {
  GoldCartData get data => throw _privateConstructorUsedError;

  /// Serializes this GoldCartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoldCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoldCartModelCopyWith<GoldCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldCartModelCopyWith<$Res> {
  factory $GoldCartModelCopyWith(
          GoldCartModel value, $Res Function(GoldCartModel) then) =
      _$GoldCartModelCopyWithImpl<$Res, GoldCartModel>;
  @useResult
  $Res call({GoldCartData data});

  $GoldCartDataCopyWith<$Res> get data;
}

/// @nodoc
class _$GoldCartModelCopyWithImpl<$Res, $Val extends GoldCartModel>
    implements $GoldCartModelCopyWith<$Res> {
  _$GoldCartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoldCartModel
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
              as GoldCartData,
    ) as $Val);
  }

  /// Create a copy of GoldCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GoldCartDataCopyWith<$Res> get data {
    return $GoldCartDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GoldCartModelImplCopyWith<$Res>
    implements $GoldCartModelCopyWith<$Res> {
  factory _$$GoldCartModelImplCopyWith(
          _$GoldCartModelImpl value, $Res Function(_$GoldCartModelImpl) then) =
      __$$GoldCartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GoldCartData data});

  @override
  $GoldCartDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GoldCartModelImplCopyWithImpl<$Res>
    extends _$GoldCartModelCopyWithImpl<$Res, _$GoldCartModelImpl>
    implements _$$GoldCartModelImplCopyWith<$Res> {
  __$$GoldCartModelImplCopyWithImpl(
      _$GoldCartModelImpl _value, $Res Function(_$GoldCartModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoldCartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GoldCartModelImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GoldCartData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoldCartModelImpl implements _GoldCartModel {
  const _$GoldCartModelImpl({required this.data});

  factory _$GoldCartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoldCartModelImplFromJson(json);

  @override
  final GoldCartData data;

  @override
  String toString() {
    return 'GoldCartModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldCartModelImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of GoldCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoldCartModelImplCopyWith<_$GoldCartModelImpl> get copyWith =>
      __$$GoldCartModelImplCopyWithImpl<_$GoldCartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoldCartModelImplToJson(
      this,
    );
  }
}

abstract class _GoldCartModel implements GoldCartModel {
  const factory _GoldCartModel({required final GoldCartData data}) =
      _$GoldCartModelImpl;

  factory _GoldCartModel.fromJson(Map<String, dynamic> json) =
      _$GoldCartModelImpl.fromJson;

  @override
  GoldCartData get data;

  /// Create a copy of GoldCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoldCartModelImplCopyWith<_$GoldCartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoldCartData _$GoldCartDataFromJson(Map<String, dynamic> json) {
  return _GoldCartData.fromJson(json);
}

/// @nodoc
mixin _$GoldCartData {
  List<GoldCartItem> get items => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get cartId => throw _privateConstructorUsedError;

  /// Serializes this GoldCartData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoldCartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoldCartDataCopyWith<GoldCartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldCartDataCopyWith<$Res> {
  factory $GoldCartDataCopyWith(
          GoldCartData value, $Res Function(GoldCartData) then) =
      _$GoldCartDataCopyWithImpl<$Res, GoldCartData>;
  @useResult
  $Res call(
      {List<GoldCartItem> items,
      int totalPrice,
      @JsonKey(name: 'id') String cartId});
}

/// @nodoc
class _$GoldCartDataCopyWithImpl<$Res, $Val extends GoldCartData>
    implements $GoldCartDataCopyWith<$Res> {
  _$GoldCartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoldCartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalPrice = null,
    Object? cartId = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GoldCartItem>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoldCartDataImplCopyWith<$Res>
    implements $GoldCartDataCopyWith<$Res> {
  factory _$$GoldCartDataImplCopyWith(
          _$GoldCartDataImpl value, $Res Function(_$GoldCartDataImpl) then) =
      __$$GoldCartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GoldCartItem> items,
      int totalPrice,
      @JsonKey(name: 'id') String cartId});
}

/// @nodoc
class __$$GoldCartDataImplCopyWithImpl<$Res>
    extends _$GoldCartDataCopyWithImpl<$Res, _$GoldCartDataImpl>
    implements _$$GoldCartDataImplCopyWith<$Res> {
  __$$GoldCartDataImplCopyWithImpl(
      _$GoldCartDataImpl _value, $Res Function(_$GoldCartDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoldCartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalPrice = null,
    Object? cartId = null,
  }) {
    return _then(_$GoldCartDataImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GoldCartItem>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoldCartDataImpl implements _GoldCartData {
  const _$GoldCartDataImpl(
      {required final List<GoldCartItem> items,
      required this.totalPrice,
      @JsonKey(name: 'id') required this.cartId})
      : _items = items;

  factory _$GoldCartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoldCartDataImplFromJson(json);

  final List<GoldCartItem> _items;
  @override
  List<GoldCartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalPrice;
  @override
  @JsonKey(name: 'id')
  final String cartId;

  @override
  String toString() {
    return 'GoldCartData(items: $items, totalPrice: $totalPrice, cartId: $cartId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldCartDataImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.cartId, cartId) || other.cartId == cartId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), totalPrice, cartId);

  /// Create a copy of GoldCartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoldCartDataImplCopyWith<_$GoldCartDataImpl> get copyWith =>
      __$$GoldCartDataImplCopyWithImpl<_$GoldCartDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoldCartDataImplToJson(
      this,
    );
  }
}

abstract class _GoldCartData implements GoldCartData {
  const factory _GoldCartData(
      {required final List<GoldCartItem> items,
      required final int totalPrice,
      @JsonKey(name: 'id') required final String cartId}) = _$GoldCartDataImpl;

  factory _GoldCartData.fromJson(Map<String, dynamic> json) =
      _$GoldCartDataImpl.fromJson;

  @override
  List<GoldCartItem> get items;
  @override
  int get totalPrice;
  @override
  @JsonKey(name: 'id')
  String get cartId;

  /// Create a copy of GoldCartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoldCartDataImplCopyWith<_$GoldCartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoldCartItem _$GoldCartItemFromJson(Map<String, dynamic> json) {
  return _GoldCartItem.fromJson(json);
}

/// @nodoc
mixin _$GoldCartItem {
  String get product => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this GoldCartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoldCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoldCartItemCopyWith<GoldCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldCartItemCopyWith<$Res> {
  factory $GoldCartItemCopyWith(
          GoldCartItem value, $Res Function(GoldCartItem) then) =
      _$GoldCartItemCopyWithImpl<$Res, GoldCartItem>;
  @useResult
  $Res call(
      {String product,
      String name,
      String image,
      int quantity,
      int price,
      @JsonKey(name: '_id') String id});
}

/// @nodoc
class _$GoldCartItemCopyWithImpl<$Res, $Val extends GoldCartItem>
    implements $GoldCartItemCopyWith<$Res> {
  _$GoldCartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoldCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? name = null,
    Object? image = null,
    Object? quantity = null,
    Object? price = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoldCartItemImplCopyWith<$Res>
    implements $GoldCartItemCopyWith<$Res> {
  factory _$$GoldCartItemImplCopyWith(
          _$GoldCartItemImpl value, $Res Function(_$GoldCartItemImpl) then) =
      __$$GoldCartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String product,
      String name,
      String image,
      int quantity,
      int price,
      @JsonKey(name: '_id') String id});
}

/// @nodoc
class __$$GoldCartItemImplCopyWithImpl<$Res>
    extends _$GoldCartItemCopyWithImpl<$Res, _$GoldCartItemImpl>
    implements _$$GoldCartItemImplCopyWith<$Res> {
  __$$GoldCartItemImplCopyWithImpl(
      _$GoldCartItemImpl _value, $Res Function(_$GoldCartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoldCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? name = null,
    Object? image = null,
    Object? quantity = null,
    Object? price = null,
    Object? id = null,
  }) {
    return _then(_$GoldCartItemImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoldCartItemImpl implements _GoldCartItem {
  const _$GoldCartItemImpl(
      {required this.product,
      required this.name,
      required this.image,
      required this.quantity,
      required this.price,
      @JsonKey(name: '_id') required this.id});

  factory _$GoldCartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoldCartItemImplFromJson(json);

  @override
  final String product;
  @override
  final String name;
  @override
  final String image;
  @override
  final int quantity;
  @override
  final int price;
  @override
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString() {
    return 'GoldCartItem(product: $product, name: $name, image: $image, quantity: $quantity, price: $price, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldCartItemImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, product, name, image, quantity, price, id);

  /// Create a copy of GoldCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoldCartItemImplCopyWith<_$GoldCartItemImpl> get copyWith =>
      __$$GoldCartItemImplCopyWithImpl<_$GoldCartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoldCartItemImplToJson(
      this,
    );
  }
}

abstract class _GoldCartItem implements GoldCartItem {
  const factory _GoldCartItem(
      {required final String product,
      required final String name,
      required final String image,
      required final int quantity,
      required final int price,
      @JsonKey(name: '_id') required final String id}) = _$GoldCartItemImpl;

  factory _GoldCartItem.fromJson(Map<String, dynamic> json) =
      _$GoldCartItemImpl.fromJson;

  @override
  String get product;
  @override
  String get name;
  @override
  String get image;
  @override
  int get quantity;
  @override
  int get price;
  @override
  @JsonKey(name: '_id')
  String get id;

  /// Create a copy of GoldCartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoldCartItemImplCopyWith<_$GoldCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
