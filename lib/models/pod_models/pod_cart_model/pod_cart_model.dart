import 'package:freezed_annotation/freezed_annotation.dart';
part 'pod_cart_model.freezed.dart';
part 'pod_cart_model.g.dart';

@freezed
abstract class PODCartModel with _$PODCartModel {
  factory PODCartModel({
    @JsonKey(name: 'data') required CartData data
  }) = _PODCartModel;

  factory PODCartModel.fromJson(Map<String, dynamic> json) =>
      _$PODCartModelFromJson(json);
}

@freezed
abstract class CartData with _$CartData {
  factory CartData({
    @JsonKey(name: 'user') @Default('')  String userId,
    @JsonKey(name: 'items') @Default([])  List<CartItem> items,
    @JsonKey(name: 'totalPrice') @Default(0)  int totalPrice,
    @JsonKey(name: 'id') @Default('')  String cartId,
  }) = _CartData;

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);
}

@freezed
abstract class CartItem with _$CartItem {
  factory CartItem({
    @JsonKey(name: 'product') required  Product product,
    @JsonKey(name: 'quantity') @Default(0)  int quantity,
    @JsonKey(name: 'size') required ProductSize size,
    @JsonKey(name: 'color') required  ProductColor color,
    @JsonKey(name: 'price') @Default(0)  int price,
    @Default('')  String image,
    @JsonKey(name: '_id') @Default('') String itemId,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@freezed
abstract class Product with _$Product {
  factory Product({
    @JsonKey(name: 'title') @Default('')  String title,
    @JsonKey(name: 'thumbnail') @Default('')  String thumbnail,
    @JsonKey(name: 'new_price')@Default('')   String newPrice,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
abstract class ProductSize with _$ProductSize {
  factory ProductSize({
    @JsonKey(name: 'name') @Default('')  String name,
    @JsonKey(name: 'id') @Default('')  String id,
  }) = _ProductSize;

  factory ProductSize.fromJson(Map<String, dynamic> json) =>
      _$ProductSizeFromJson(json);
}

@freezed
abstract class ProductColor with _$ProductColor {
  factory ProductColor({
    @JsonKey(name: 'colorName') @Default('')  String colorName,
    @JsonKey(name: 'colorCode') @Default('')  String colorCode,
    @JsonKey(name: 'id') String? id,
  }) = _ProductColor;

  factory ProductColor.fromJson(Map<String, dynamic> json) =>
      _$ProductColorFromJson(json);
}
