// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_rates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatesResponseImpl _$$RatesResponseImplFromJson(Map<String, dynamic> json) =>
    _$RatesResponseImpl(
      result: json['result'] == null
          ? null
          : RatesResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RatesResponseImplToJson(_$RatesResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

_$RatesResultImpl _$$RatesResultImplFromJson(Map<String, dynamic> json) =>
    _$RatesResultImpl(
      data: json['data'] == null
          ? null
          : RatesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RatesResultImplToJson(_$RatesResultImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$RatesDataImpl _$$RatesDataImplFromJson(Map<String, dynamic> json) =>
    _$RatesDataImpl(
      rates: json['rates'] == null
          ? null
          : Rates.fromJson(json['rates'] as Map<String, dynamic>),
      taxes: (json['taxes'] as List<dynamic>?)
          ?.map((e) => Tax.fromJson(e as Map<String, dynamic>))
          .toList(),
      blockId: json['blockId'] as String?,
    );

Map<String, dynamic> _$$RatesDataImplToJson(_$RatesDataImpl instance) =>
    <String, dynamic>{
      'rates': instance.rates,
      'taxes': instance.taxes,
      'blockId': instance.blockId,
    };

_$RatesImpl _$$RatesImplFromJson(Map<String, dynamic> json) => _$RatesImpl(
      gBuy: json['gBuy'] as String?,
      gSell: json['gSell'] as String?,
      sBuy: json['sBuy'] as String?,
      sSell: json['sSell'] as String?,
      gBuyGst: json['gBuyGst'] as String?,
      sBuyGst: json['sBuyGst'] as String?,
    );

Map<String, dynamic> _$$RatesImplToJson(_$RatesImpl instance) =>
    <String, dynamic>{
      'gBuy': instance.gBuy,
      'gSell': instance.gSell,
      'sBuy': instance.sBuy,
      'sSell': instance.sSell,
      'gBuyGst': instance.gBuyGst,
      'sBuyGst': instance.sBuyGst,
    };

_$TaxImpl _$$TaxImplFromJson(Map<String, dynamic> json) => _$TaxImpl(
      type: json['type'] as String?,
      taxPerc: json['taxPerc'] as String?,
    );

Map<String, dynamic> _$$TaxImplToJson(_$TaxImpl instance) => <String, dynamic>{
      'type': instance.type,
      'taxPerc': instance.taxPerc,
    };
