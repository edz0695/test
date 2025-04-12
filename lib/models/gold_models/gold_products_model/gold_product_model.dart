import 'package:freezed_annotation/freezed_annotation.dart';
part 'gold_product_model.g.dart';
part 'gold_product_model.freezed.dart';

@freezed
class GoldProductModel with _$GoldProductModel {
  factory GoldProductModel({
    @Default('') String name,
    @Default('') String sku,
    @Default('') String productWeight,
    @Default('') String redeemWeight,
    @Default('') String metalType,
    @Default('') String purity,
    @Default('') String jewelleryType,
    @Default('') String productSize,
    @Default('') String basePrice,
    @Default('') String description,
    @Default('') String status,
    @Default([]) List<ProductImage> productImages,
  }) = _GoldProductModel;

  factory GoldProductModel.fromJson(Map<String, dynamic> json) =>
      _$GoldProductModelFromJson(json);
}

@freezed
class ProductImage with _$ProductImage {
  factory ProductImage({
    @Default('') String url,
    @Default(0) int displayOrder,
    @Default(false) bool defaultImage,
  }) = _ProductImage;

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}
