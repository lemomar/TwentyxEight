// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyValue _$CurrencyValueFromJson(Map<String, dynamic> json) =>
    CurrencyValue(
      symbol: json['symbol'] as String? ?? '',
      value: (json['price'] as num).toDouble(),
      timestamp: (json['time'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrencyValueToJson(CurrencyValue instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'price': instance.value,
      'time': instance.timestamp,
    };
