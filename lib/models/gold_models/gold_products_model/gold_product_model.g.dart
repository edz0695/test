// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoldProductModelImpl _$$GoldProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GoldProductModelImpl(
      name: json['name'] as String? ?? '',
      sku: json['sku'] as String? ?? '',
      productWeight: json['productWeight'] as String? ?? '',
      redeemWeight: json['redeemWeight'] as String? ?? '',
      metalType: json['metalType'] as String? ?? '',
      purity: json['purity'] as String? ?? '',
      jewelleryType: json['jewelleryType'] as String? ?? '',
      productSize: json['productSize'] as String? ?? '',
      basePrice: json['basePrice'] as String? ?? '',
      description: json['description'] as String? ?? '',
      status: json['status'] as String? ?? '',
      productImages: (json['productImages'] as List<dynamic>?)
              ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GoldProductModelImplToJson(
        _$GoldProductModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sku': instance.sku,
      'productWeight': instance.productWeight,
      'redeemWeight': instance.redeemWeight,
      'metalType': instance.metalType,
      'purity': instance.purity,
      'jewelleryType': instance.jewelleryType,
      'productSize': instance.productSize,
      'basePrice': instance.basePrice,
      'description': instance.description,
      'status': instance.status,
      'productImages': instance.productImages,
    };

_$ProductImageImpl _$$ProductImageImplFromJson(Map<String, dynamic> json) =>
    _$ProductImageImpl(
      url: json['url'] as String? ?? '',
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      defaultImage: json['defaultImage'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductImageImplToJson(_$ProductImageImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'displayOrder': instance.displayOrder,
      'defaultImage': instance.defaultImage,
    };
