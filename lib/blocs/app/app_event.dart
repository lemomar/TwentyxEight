part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppUserChanged extends AppEvent {
  const AppUserChanged({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}

class CurrencyDataChanged extends AppEvent {
  const CurrencyDataChanged({required this.currencies});

  final List<Currency> currencies;

  @override
  List<Object> get props => [currencies];
}

class UserDataChanged extends AppEvent {
  const UserDataChanged({required this.userData, required this.user});

  final UserData userData;
  final User user;

  @override
  List<Object> get props => [userData, user];
}

class FavoriteCurrencyChanged extends AppEvent {
  const FavoriteCurrencyChanged(
      {required this.favoriteCurrencySymbol, required this.user});

  final String? favoriteCurrencySymbol;
  final User user;

  @override
  List<Object> get props => [favoriteCurrencySymbol ?? '', user];
}

class HeldCurrencyListChanged extends AppEvent {
  const HeldCurrencyListChanged(
      {required this.heldCurrencyList, required this.user});

  final List<HeldCurrency> heldCurrencyList;
  final User user;

  @override
  List<Object> get props => [heldCurrencyList, user];
}
