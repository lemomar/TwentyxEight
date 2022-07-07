// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'held_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeldCurrency _$HeldCurrencyFromJson(Map<String, dynamic> json) => HeldCurrency(
      value: (json['value'] as num).toDouble(),
      symbol: json['symbol'] as String,
    );

Map<String, dynamic> _$HeldCurrencyToJson(HeldCurrency instance) =>
    <String, dynamic>{
      'value': instance.value,
      'symbol': instance.symbol,
    };
