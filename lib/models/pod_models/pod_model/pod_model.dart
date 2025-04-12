import 'package:freezed_annotation/freezed_annotation.dart';

part 'pod_model.freezed.dart';
part 'pod_model.g.dart';

@freezed
class PODModel with _$PODModel {
  const factory PODModel({
    required PODData data,
  }) = _PODModel;

  factory PODModel.fromJson(Map<String, dynamic> json) =>
      _$PODModelFromJson(json);
}

@freezed
class PODData with _$PODData {
  const factory PODData({
    required Category category,
    @JsonKey(name: 'sub_category') required String subCategory,
    @JsonKey(name: 'sub_category1') required String subCategory1,
    required String title,
    List<String>? images,
    required String thumbnail,
    @JsonKey(name: 'product_description') required String productDescription,
    @JsonKey(name: 'short_description') required String shortDescription,
    @JsonKey(name: 'old_price') required String oldPrice,
    @JsonKey(name: 'new_price') required String newPrice,
    List<ColorModel>? colors,
    List<SizeModel>? size,
    List<dynamic>? ratings,
    @JsonKey(name: 'id') required String id,
  }) = _PODData;

  factory PODData.fromJson(Map<String, dynamic> json) =>
      _$PODDataFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: 'cat_name') required String catName,
    @JsonKey(name: 'cat_img') required String catImg,
    @JsonKey(name: 'id') required String id,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class ColorModel with _$ColorModel {
  const factory ColorModel({
    @JsonKey(name: 'colorName') required String colorName,
    @JsonKey(name: 'colorCode') required String colorCode,
    @JsonKey(name: 'id') required String id,
  }) = _ColorModel;

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
}

@freezed
class SizeModel with _$SizeModel {
  const factory SizeModel({
    required SizeDetail size,
    List<String>? media,
    required String price,
    required String title,
    @JsonKey(name: '_id') required String id,
  }) = _SizeModel;

  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
}

@freezed
class SizeDetail with _$SizeDetail {
  const factory SizeDetail({
    required String name,
    @JsonKey(name: 'id') required String id,
  }) = _SizeDetail;

  factory SizeDetail.fromJson(Map<String, dynamic> json) =>
      _$SizeDetailFromJson(json);
}
