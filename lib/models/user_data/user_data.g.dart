// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      favoriteCurrencySymbol: json['favoriteCurrencySymbol'] as String?,
      heldCurrencyList: (json['held'] as List<dynamic>?)
          ?.map((dynamic e) => HeldCurrency.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'favoriteCurrencySymbol': instance.favoriteCurrencySymbol,
      'held': instance.heldCurrencyList,
    };
