// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoldCartModelImpl _$$GoldCartModelImplFromJson(Map<String, dynamic> json) =>
    _$GoldCartModelImpl(
      data: GoldCartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GoldCartModelImplToJson(_$GoldCartModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$GoldCartDataImpl _$$GoldCartDataImplFromJson(Map<String, dynamic> json) =>
    _$GoldCartDataImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => GoldCartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toInt(),
      cartId: json['id'] as String,
    );

Map<String, dynamic> _$$GoldCartDataImplToJson(_$GoldCartDataImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'totalPrice': instance.totalPrice,
      'id': instance.cartId,
    };

_$GoldCartItemImpl _$$GoldCartItemImplFromJson(Map<String, dynamic> json) =>
    _$GoldCartItemImpl(
      product: json['product'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$GoldCartItemImplToJson(_$GoldCartItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'name': instance.name,
      'image': instance.image,
      'quantity': instance.quantity,
      'price': instance.price,
      '_id': instance.id,
    };
