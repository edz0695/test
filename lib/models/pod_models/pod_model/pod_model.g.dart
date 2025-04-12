// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PODModelImpl _$$PODModelImplFromJson(Map<String, dynamic> json) =>
    _$PODModelImpl(
      data: PODData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PODModelImplToJson(_$PODModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PODDataImpl _$$PODDataImplFromJson(Map<String, dynamic> json) =>
    _$PODDataImpl(
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      subCategory: json['sub_category'] as String,
      subCategory1: json['sub_category1'] as String,
      title: json['title'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String,
      productDescription: json['product_description'] as String,
      shortDescription: json['short_description'] as String,
      oldPrice: json['old_price'] as String,
      newPrice: json['new_price'] as String,
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      size: (json['size'] as List<dynamic>?)
          ?.map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratings: json['ratings'] as List<dynamic>?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$PODDataImplToJson(_$PODDataImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'sub_category': instance.subCategory,
      'sub_category1': instance.subCategory1,
      'title': instance.title,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
      'product_description': instance.productDescription,
      'short_description': instance.shortDescription,
      'old_price': instance.oldPrice,
      'new_price': instance.newPrice,
      'colors': instance.colors,
      'size': instance.size,
      'ratings': instance.ratings,
      'id': instance.id,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      catName: json['cat_name'] as String,
      catImg: json['cat_img'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'cat_name': instance.catName,
      'cat_img': instance.catImg,
      'id': instance.id,
    };

_$ColorModelImpl _$$ColorModelImplFromJson(Map<String, dynamic> json) =>
    _$ColorModelImpl(
      colorName: json['colorName'] as String,
      colorCode: json['colorCode'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$ColorModelImplToJson(_$ColorModelImpl instance) =>
    <String, dynamic>{
      'colorName': instance.colorName,
      'colorCode': instance.colorCode,
      'id': instance.id,
    };

_$SizeModelImpl _$$SizeModelImplFromJson(Map<String, dynamic> json) =>
    _$SizeModelImpl(
      size: SizeDetail.fromJson(json['size'] as Map<String, dynamic>),
      media:
          (json['media'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as String,
      title: json['title'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$SizeModelImplToJson(_$SizeModelImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'media': instance.media,
      'price': instance.price,
      'title': instance.title,
      '_id': instance.id,
    };

_$SizeDetailImpl _$$SizeDetailImplFromJson(Map<String, dynamic> json) =>
    _$SizeDetailImpl(
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$SizeDetailImplToJson(_$SizeDetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
