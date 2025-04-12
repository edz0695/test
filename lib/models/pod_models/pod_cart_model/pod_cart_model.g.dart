// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PODCartModelImpl _$$PODCartModelImplFromJson(Map<String, dynamic> json) =>
    _$PODCartModelImpl(
      data: CartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PODCartModelImplToJson(_$PODCartModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$CartDataImpl _$$CartDataImplFromJson(Map<String, dynamic> json) =>
    _$CartDataImpl(
      userId: json['user'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPrice: (json['totalPrice'] as num?)?.toInt() ?? 0,
      cartId: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$$CartDataImplToJson(_$CartDataImpl instance) =>
    <String, dynamic>{
      'user': instance.userId,
      'items': instance.items,
      'totalPrice': instance.totalPrice,
      'id': instance.cartId,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      size: ProductSize.fromJson(json['size'] as Map<String, dynamic>),
      color: ProductColor.fromJson(json['color'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt() ?? 0,
      image: json['image'] as String? ?? '',
      itemId: json['_id'] as String? ?? '',
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'size': instance.size,
      'color': instance.color,
      'price': instance.price,
      'image': instance.image,
      '_id': instance.itemId,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      title: json['title'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      newPrice: json['new_price'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'new_price': instance.newPrice,
    };

_$ProductSizeImpl _$$ProductSizeImplFromJson(Map<String, dynamic> json) =>
    _$ProductSizeImpl(
      name: json['name'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductSizeImplToJson(_$ProductSizeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

_$ProductColorImpl _$$ProductColorImplFromJson(Map<String, dynamic> json) =>
    _$ProductColorImpl(
      colorName: json['colorName'] as String? ?? '',
      colorCode: json['colorCode'] as String? ?? '',
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$ProductColorImplToJson(_$ProductColorImpl instance) =>
    <String, dynamic>{
      'colorName': instance.colorName,
      'colorCode': instance.colorCode,
      'id': instance.id,
    };
