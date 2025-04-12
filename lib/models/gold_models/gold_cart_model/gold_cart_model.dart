import 'package:freezed_annotation/freezed_annotation.dart';
part 'gold_cart_model.freezed.dart';
part 'gold_cart_model.g.dart';

@freezed
class GoldCartModel with _$GoldCartModel {
  const factory GoldCartModel({
    required GoldCartData data,
  }) = _GoldCartModel;

  factory GoldCartModel.fromJson(Map<String, dynamic> json) =>
      _$GoldCartModelFromJson(json);
}

@freezed
class GoldCartData with _$GoldCartData {
  const factory GoldCartData({
    required List<GoldCartItem> items,
    required int totalPrice,
    @JsonKey(name: 'id') required String cartId,
  }) = _GoldCartData;

  factory GoldCartData.fromJson(Map<String, dynamic> json) =>
      _$GoldCartDataFromJson(json);
}

@freezed
class GoldCartItem with _$GoldCartItem {
  const factory GoldCartItem({
    required String product,
    required String name,
    required String image,
    required int quantity,
    required int price,
    @JsonKey(name: '_id') required String id,
  }) = _GoldCartItem;

  factory GoldCartItem.fromJson(Map<String, dynamic> json) =>
      _$GoldCartItemFromJson(json);
}
