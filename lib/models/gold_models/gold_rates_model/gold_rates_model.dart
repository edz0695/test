import 'package:freezed_annotation/freezed_annotation.dart';

part 'gold_rates_model.freezed.dart';
part 'gold_rates_model.g.dart';

@freezed
class RatesResponse with _$RatesResponse {
  factory RatesResponse({
    RatesResult? result,
  }) = _RatesResponse;

  factory RatesResponse.fromJson(Map<String, dynamic> json) =>
      _$RatesResponseFromJson(json);
}

@freezed
class RatesResult with _$RatesResult {
  factory RatesResult({
    RatesData? data,
  }) = _RatesResult;

  factory RatesResult.fromJson(Map<String, dynamic> json) =>
      _$RatesResultFromJson(json);
}

@freezed
class RatesData with _$RatesData {
  factory RatesData({
    Rates? rates,
    List<Tax>? taxes,
    String? blockId,
  }) = _RatesData;

  factory RatesData.fromJson(Map<String, dynamic> json) =>
      _$RatesDataFromJson(json);
}

@freezed
class Rates with _$Rates {
  factory Rates({
    String? gBuy,
    String? gSell,
    String? sBuy,
    String? sSell,
    String? gBuyGst,
    String? sBuyGst,
  }) = _Rates;

  factory Rates.fromJson(Map<String, dynamic> json) => _$RatesFromJson(json);
}

@freezed
class Tax with _$Tax {
  factory Tax({
    String? type,
    String? taxPerc,
  }) = _Tax;

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);
}
