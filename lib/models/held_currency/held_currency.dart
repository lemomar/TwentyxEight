// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import '../models.dart';

part 'held_currency.g.dart';

@JsonSerializable()
class HeldCurrency {
  HeldCurrency({required this.value, required this.symbol});

  final double value;
  final String symbol;

  factory HeldCurrency.fromJson(Map<String, dynamic> json) =>
      _$HeldCurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$HeldCurrencyToJson(this);
}

final sampleHeldCurrencyList =
    sampleCurrencyList.map((currency) => currency.toHeldCurrency(1)).toList();
