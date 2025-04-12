// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ca_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CAServicesModelImpl _$$CAServicesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CAServicesModelImpl(
      data: CAServicesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CAServicesModelImplToJson(
        _$CAServicesModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$CAServicesDataImpl _$$CAServicesDataImplFromJson(Map<String, dynamic> json) =>
    _$CAServicesDataImpl(
      title: json['title'] as String? ?? "",
      price: json['price'] as String? ?? "",
      crossPrice: json['cross_price'] as String? ?? "",
      categoryId: json['category_id'] as String? ?? "",
      subCategoryId: json['sub_category'] as String? ?? "",
      sub2CategoryId: json['sub2_category'] as String? ?? "",
      logo: json['logo'] as String? ?? "",
      id: json['id'] as String? ?? "",
      banners: (json['banners'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      benefits: (json['benefits'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CAServicesDataImplToJson(
        _$CAServicesDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'cross_price': instance.crossPrice,
      'category_id': instance.categoryId,
      'sub_category': instance.subCategoryId,
      'sub2_category': instance.sub2CategoryId,
      'logo': instance.logo,
      'id': instance.id,
      'banners': instance.banners,
      'benefits': instance.benefits,
    };
