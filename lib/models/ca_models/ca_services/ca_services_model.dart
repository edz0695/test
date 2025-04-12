import 'package:freezed_annotation/freezed_annotation.dart';

part 'ca_services_model.freezed.dart';
part 'ca_services_model.g.dart';

@freezed
class CAServicesModel with _$CAServicesModel {
  factory CAServicesModel({
   required CAServicesData data,
  }) = _CAServicesModel;

  factory CAServicesModel.fromJson(Map<String, dynamic> json) =>
      _$CAServicesModelFromJson(json);
}

@freezed
class CAServicesData with _$CAServicesData {
  const factory CAServicesData({
    @Default("") String title,
    @Default("") String price,
    @Default("") @JsonKey(name: "cross_price") String crossPrice,
    @Default("") @JsonKey(name: "category_id") String categoryId,
    @Default("") @JsonKey(name: "sub_category") String subCategoryId,
    @Default("") @JsonKey(name: "sub2_category") String sub2CategoryId,
    @Default("") String logo,
    @Default("") String id,
    @Default([]) List<String> banners,
    @Default([]) List<String> benefits,
  }) = _CAServicesData;

  factory CAServicesData.fromJson(Map<String, dynamic> json) =>
      _$CAServicesDataFromJson(json);
}
