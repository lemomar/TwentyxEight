part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  const AppState.unauthenticated(List<Currency> currencies)
      : this._(status: AppStatus.unauthenticated, currencies: currencies);
  const AppState.authenticated(User user, List<Currency> currencies)
      : this._(
            status: AppStatus.authenticated,
            user: user,
            currencies: currencies);
  const AppState._({
    required this.status,
    this.user = User.empty,
    this.currencies = defaultCurrencyList,
  });
  final User user;
  final AppStatus status;
  final List<Currency> currencies;

  @override
  List<Object> get props => [status, user, currencies];
}
