// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pod_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PODCartModel _$PODCartModelFromJson(Map<String, dynamic> json) {
  return _PODCartModel.fromJson(json);
}

/// @nodoc
mixin _$PODCartModel {
  @JsonKey(name: 'data')
  CartData get data => throw _privateConstructorUsedError;

  /// Serializes this PODCartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PODCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PODCartModelCopyWith<PODCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PODCartModelCopyWith<$Res> {
  factory $PODCartModelCopyWith(
          PODCartModel value, $Res Function(PODCartModel) then) =
      _$PODCartModelCopyWithImpl<$Res, PODCartModel>;
  @useResult
  $Res call({@JsonKey(name: 'data') CartData data});

  $CartDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PODCartModelCopyWithImpl<$Res, $Val extends PODCartModel>
    implements $PODCartModelCopyWith<$Res> {
  _$PODCartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PODCartModel
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
              as CartData,
    ) as $Val);
  }

  /// Create a copy of PODCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartDataCopyWith<$Res> get data {
    return $CartDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PODCartModelImplCopyWith<$Res>
    implements $PODCartModelCopyWith<$Res> {
  factory _$$PODCartModelImplCopyWith(
          _$PODCartModelImpl value, $Res Function(_$PODCartModelImpl) then) =
      __$$PODCartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') CartData data});

  @override
  $CartDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PODCartModelImplCopyWithImpl<$Res>
    extends _$PODCartModelCopyWithImpl<$Res, _$PODCartModelImpl>
    implements _$$PODCartModelImplCopyWith<$Res> {
  __$$PODCartModelImplCopyWithImpl(
      _$PODCartModelImpl _value, $Res Function(_$PODCartModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PODCartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PODCartModelImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CartData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PODCartModelImpl implements _PODCartModel {
  _$PODCartModelImpl({@JsonKey(name: 'data') required this.data});

  factory _$PODCartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PODCartModelImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final CartData data;

  @override
  String toString() {
    return 'PODCartModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PODCartModelImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of PODCartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PODCartModelImplCopyWith<_$PODCartModelImpl> get copyWith =>
      __$$PODCartModelImplCopyWithImpl<_$PODCartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PODCartModelImplToJson(
      this,
    );
  }
}

abstract class _PODCartModel implements PODCartModel {
  factory _PODCartModel({@JsonKey(name: 'data') required final CartData data}) =
      _$PODCartModelImpl;

  factory _PODCartModel.fromJson(Map<String, dynamic> json) =
      _$PODCartModelImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  CartData get data;

  /// Create a copy of PODCartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PODCartModelImplCopyWith<_$PODCartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartData _$CartDataFromJson(Map<String, dynamic> json) {
  return _CartData.fromJson(json);
}

/// @nodoc
mixin _$CartData {
  @JsonKey(name: 'user')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<CartItem> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice')
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get cartId => throw _privateConstructorUsedError;

  /// Serializes this CartData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartDataCopyWith<CartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDataCopyWith<$Res> {
  factory $CartDataCopyWith(CartData value, $Res Function(CartData) then) =
      _$CartDataCopyWithImpl<$Res, CartData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user') String userId,
      @JsonKey(name: 'items') List<CartItem> items,
      @JsonKey(name: 'totalPrice') int totalPrice,
      @JsonKey(name: 'id') String cartId});
}

/// @nodoc
class _$CartDataCopyWithImpl<$Res, $Val extends CartData>
    implements $CartDataCopyWith<$Res> {
  _$CartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? items = null,
    Object? totalPrice = null,
    Object? cartId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
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
abstract class _$$CartDataImplCopyWith<$Res>
    implements $CartDataCopyWith<$Res> {
  factory _$$CartDataImplCopyWith(
          _$CartDataImpl value, $Res Function(_$CartDataImpl) then) =
      __$$CartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user') String userId,
      @JsonKey(name: 'items') List<CartItem> items,
      @JsonKey(name: 'totalPrice') int totalPrice,
      @JsonKey(name: 'id') String cartId});
}

/// @nodoc
class __$$CartDataImplCopyWithImpl<$Res>
    extends _$CartDataCopyWithImpl<$Res, _$CartDataImpl>
    implements _$$CartDataImplCopyWith<$Res> {
  __$$CartDataImplCopyWithImpl(
      _$CartDataImpl _value, $Res Function(_$CartDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? items = null,
    Object? totalPrice = null,
    Object? cartId = null,
  }) {
    return _then(_$CartDataImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
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
class _$CartDataImpl implements _CartData {
  _$CartDataImpl(
      {@JsonKey(name: 'user') this.userId = '',
      @JsonKey(name: 'items') final List<CartItem> items = const [],
      @JsonKey(name: 'totalPrice') this.totalPrice = 0,
      @JsonKey(name: 'id') this.cartId = ''})
      : _items = items;

  factory _$CartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartDataImplFromJson(json);

  @override
  @JsonKey(name: 'user')
  final String userId;
  final List<CartItem> _items;
  @override
  @JsonKey(name: 'items')
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'totalPrice')
  final int totalPrice;
  @override
  @JsonKey(name: 'id')
  final String cartId;

  @override
  String toString() {
    return 'CartData(userId: $userId, items: $items, totalPrice: $totalPrice, cartId: $cartId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.cartId, cartId) || other.cartId == cartId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(_items), totalPrice, cartId);

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartDataImplCopyWith<_$CartDataImpl> get copyWith =>
      __$$CartDataImplCopyWithImpl<_$CartDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartDataImplToJson(
      this,
    );
  }
}

abstract class _CartData implements CartData {
  factory _CartData(
      {@JsonKey(name: 'user') final String userId,
      @JsonKey(name: 'items') final List<CartItem> items,
      @JsonKey(name: 'totalPrice') final int totalPrice,
      @JsonKey(name: 'id') final String cartId}) = _$CartDataImpl;

  factory _CartData.fromJson(Map<String, dynamic> json) =
      _$CartDataImpl.fromJson;

  @override
  @JsonKey(name: 'user')
  String get userId;
  @override
  @JsonKey(name: 'items')
  List<CartItem> get items;
  @override
  @JsonKey(name: 'totalPrice')
  int get totalPrice;
  @override
  @JsonKey(name: 'id')
  String get cartId;

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartDataImplCopyWith<_$CartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  @JsonKey(name: 'product')
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  ProductSize get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  ProductColor get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get itemId => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product') Product product,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'size') ProductSize size,
      @JsonKey(name: 'color') ProductColor color,
      @JsonKey(name: 'price') int price,
      String image,
      @JsonKey(name: '_id') String itemId});

  $ProductCopyWith<$Res> get product;
  $ProductSizeCopyWith<$Res> get size;
  $ProductColorCopyWith<$Res> get color;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? size = null,
    Object? color = null,
    Object? price = null,
    Object? image = null,
    Object? itemId = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as ProductSize,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ProductColor,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductSizeCopyWith<$Res> get size {
    return $ProductSizeCopyWith<$Res>(_value.size, (value) {
      return _then(_value.copyWith(size: value) as $Val);
    });
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductColorCopyWith<$Res> get color {
    return $ProductColorCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product') Product product,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'size') ProductSize size,
      @JsonKey(name: 'color') ProductColor color,
      @JsonKey(name: 'price') int price,
      String image,
      @JsonKey(name: '_id') String itemId});

  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductSizeCopyWith<$Res> get size;
  @override
  $ProductColorCopyWith<$Res> get color;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? size = null,
    Object? color = null,
    Object? price = null,
    Object? image = null,
    Object? itemId = null,
  }) {
    return _then(_$CartItemImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as ProductSize,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ProductColor,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  _$CartItemImpl(
      {@JsonKey(name: 'product') required this.product,
      @JsonKey(name: 'quantity') this.quantity = 0,
      @JsonKey(name: 'size') required this.size,
      @JsonKey(name: 'color') required this.color,
      @JsonKey(name: 'price') this.price = 0,
      this.image = '',
      @JsonKey(name: '_id') this.itemId = ''});

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  @JsonKey(name: 'product')
  final Product product;
  @override
  @JsonKey(name: 'quantity')
  final int quantity;
  @override
  @JsonKey(name: 'size')
  final ProductSize size;
  @override
  @JsonKey(name: 'color')
  final ProductColor color;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey(name: '_id')
  final String itemId;

  @override
  String toString() {
    return 'CartItem(product: $product, quantity: $quantity, size: $size, color: $color, price: $price, image: $image, itemId: $itemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, product, quantity, size, color, price, image, itemId);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  factory _CartItem(
      {@JsonKey(name: 'product') required final Product product,
      @JsonKey(name: 'quantity') final int quantity,
      @JsonKey(name: 'size') required final ProductSize size,
      @JsonKey(name: 'color') required final ProductColor color,
      @JsonKey(name: 'price') final int price,
      final String image,
      @JsonKey(name: '_id') final String itemId}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  @JsonKey(name: 'product')
  Product get product;
  @override
  @JsonKey(name: 'quantity')
  int get quantity;
  @override
  @JsonKey(name: 'size')
  ProductSize get size;
  @override
  @JsonKey(name: 'color')
  ProductColor get color;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  String get image;
  @override
  @JsonKey(name: '_id')
  String get itemId;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail')
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_price')
  String get newPrice => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'thumbnail') String thumbnail,
      @JsonKey(name: 'new_price') String newPrice});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? thumbnail = null,
    Object? newPrice = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      newPrice: null == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'thumbnail') String thumbnail,
      @JsonKey(name: 'new_price') String newPrice});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? thumbnail = null,
    Object? newPrice = null,
  }) {
    return _then(_$ProductImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      newPrice: null == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {@JsonKey(name: 'title') this.title = '',
      @JsonKey(name: 'thumbnail') this.thumbnail = '',
      @JsonKey(name: 'new_price') this.newPrice = ''});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'thumbnail')
  final String thumbnail;
  @override
  @JsonKey(name: 'new_price')
  final String newPrice;

  @override
  String toString() {
    return 'Product(title: $title, thumbnail: $thumbnail, newPrice: $newPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.newPrice, newPrice) ||
                other.newPrice == newPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, thumbnail, newPrice);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {@JsonKey(name: 'title') final String title,
      @JsonKey(name: 'thumbnail') final String thumbnail,
      @JsonKey(name: 'new_price') final String newPrice}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'thumbnail')
  String get thumbnail;
  @override
  @JsonKey(name: 'new_price')
  String get newPrice;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductSize _$ProductSizeFromJson(Map<String, dynamic> json) {
  return _ProductSize.fromJson(json);
}

/// @nodoc
mixin _$ProductSize {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  /// Serializes this ProductSize to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductSizeCopyWith<ProductSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSizeCopyWith<$Res> {
  factory $ProductSizeCopyWith(
          ProductSize value, $Res Function(ProductSize) then) =
      _$ProductSizeCopyWithImpl<$Res, ProductSize>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name, @JsonKey(name: 'id') String id});
}

/// @nodoc
class _$ProductSizeCopyWithImpl<$Res, $Val extends ProductSize>
    implements $ProductSizeCopyWith<$Res> {
  _$ProductSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductSize
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
abstract class _$$ProductSizeImplCopyWith<$Res>
    implements $ProductSizeCopyWith<$Res> {
  factory _$$ProductSizeImplCopyWith(
          _$ProductSizeImpl value, $Res Function(_$ProductSizeImpl) then) =
      __$$ProductSizeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name, @JsonKey(name: 'id') String id});
}

/// @nodoc
class __$$ProductSizeImplCopyWithImpl<$Res>
    extends _$ProductSizeCopyWithImpl<$Res, _$ProductSizeImpl>
    implements _$$ProductSizeImplCopyWith<$Res> {
  __$$ProductSizeImplCopyWithImpl(
      _$ProductSizeImpl _value, $Res Function(_$ProductSizeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductSize
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$ProductSizeImpl(
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
class _$ProductSizeImpl implements _ProductSize {
  _$ProductSizeImpl(
      {@JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'id') this.id = ''});

  factory _$ProductSizeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductSizeImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  String toString() {
    return 'ProductSize(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSizeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  /// Create a copy of ProductSize
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSizeImplCopyWith<_$ProductSizeImpl> get copyWith =>
      __$$ProductSizeImplCopyWithImpl<_$ProductSizeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductSizeImplToJson(
      this,
    );
  }
}

abstract class _ProductSize implements ProductSize {
  factory _ProductSize(
      {@JsonKey(name: 'name') final String name,
      @JsonKey(name: 'id') final String id}) = _$ProductSizeImpl;

  factory _ProductSize.fromJson(Map<String, dynamic> json) =
      _$ProductSizeImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'id')
  String get id;

  /// Create a copy of ProductSize
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductSizeImplCopyWith<_$ProductSizeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductColor _$ProductColorFromJson(Map<String, dynamic> json) {
  return _ProductColor.fromJson(json);
}

/// @nodoc
mixin _$ProductColor {
  @JsonKey(name: 'colorName')
  String get colorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'colorCode')
  String get colorCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this ProductColor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductColorCopyWith<ProductColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductColorCopyWith<$Res> {
  factory $ProductColorCopyWith(
          ProductColor value, $Res Function(ProductColor) then) =
      _$ProductColorCopyWithImpl<$Res, ProductColor>;
  @useResult
  $Res call(
      {@JsonKey(name: 'colorName') String colorName,
      @JsonKey(name: 'colorCode') String colorCode,
      @JsonKey(name: 'id') String? id});
}

/// @nodoc
class _$ProductColorCopyWithImpl<$Res, $Val extends ProductColor>
    implements $ProductColorCopyWith<$Res> {
  _$ProductColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductColor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorName = null,
    Object? colorCode = null,
    Object? id = freezed,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductColorImplCopyWith<$Res>
    implements $ProductColorCopyWith<$Res> {
  factory _$$ProductColorImplCopyWith(
          _$ProductColorImpl value, $Res Function(_$ProductColorImpl) then) =
      __$$ProductColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'colorName') String colorName,
      @JsonKey(name: 'colorCode') String colorCode,
      @JsonKey(name: 'id') String? id});
}

/// @nodoc
class __$$ProductColorImplCopyWithImpl<$Res>
    extends _$ProductColorCopyWithImpl<$Res, _$ProductColorImpl>
    implements _$$ProductColorImplCopyWith<$Res> {
  __$$ProductColorImplCopyWithImpl(
      _$ProductColorImpl _value, $Res Function(_$ProductColorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductColor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorName = null,
    Object? colorCode = null,
    Object? id = freezed,
  }) {
    return _then(_$ProductColorImpl(
      colorName: null == colorName
          ? _value.colorName
          : colorName // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductColorImpl implements _ProductColor {
  _$ProductColorImpl(
      {@JsonKey(name: 'colorName') this.colorName = '',
      @JsonKey(name: 'colorCode') this.colorCode = '',
      @JsonKey(name: 'id') this.id});

  factory _$ProductColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductColorImplFromJson(json);

  @override
  @JsonKey(name: 'colorName')
  final String colorName;
  @override
  @JsonKey(name: 'colorCode')
  final String colorCode;
  @override
  @JsonKey(name: 'id')
  final String? id;

  @override
  String toString() {
    return 'ProductColor(colorName: $colorName, colorCode: $colorCode, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductColorImpl &&
            (identical(other.colorName, colorName) ||
                other.colorName == colorName) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, colorName, colorCode, id);

  /// Create a copy of ProductColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductColorImplCopyWith<_$ProductColorImpl> get copyWith =>
      __$$ProductColorImplCopyWithImpl<_$ProductColorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductColorImplToJson(
      this,
    );
  }
}

abstract class _ProductColor implements ProductColor {
  factory _ProductColor(
      {@JsonKey(name: 'colorName') final String colorName,
      @JsonKey(name: 'colorCode') final String colorCode,
      @JsonKey(name: 'id') final String? id}) = _$ProductColorImpl;

  factory _ProductColor.fromJson(Map<String, dynamic> json) =
      _$ProductColorImpl.fromJson;

  @override
  @JsonKey(name: 'colorName')
  String get colorName;
  @override
  @JsonKey(name: 'colorCode')
  String get colorCode;
  @override
  @JsonKey(name: 'id')
  String? get id;

  /// Create a copy of ProductColor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductColorImplCopyWith<_$ProductColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
