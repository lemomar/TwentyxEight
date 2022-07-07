// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../held_currency/held_currency.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  UserData({
    required this.favoriteCurrencySymbol,
    required this.heldCurrencyList,
  });

  final String? favoriteCurrencySymbol;
  @JsonKey(name: 'held')
  final List<HeldCurrency>? heldCurrencyList;

  static UserData get empty =>
      UserData(favoriteCurrencySymbol: '', heldCurrencyList: []);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
