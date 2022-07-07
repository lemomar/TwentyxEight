// ignore_for_file: cancel_subscriptions

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
      {required AuthRepository authRepository,
      required UserDataRepository userDataRepository})
      : _authRepository = authRepository,
        _userDataRepository = userDataRepository,
        super(
          authRepository.currentUser.isNotEmpty
              ? AppState.authenticated(
                  authRepository.currentUser, defaultCurrencyList)
              : const AppState.unauthenticated(defaultCurrencyList),
        ) {
    on<CurrencyDataChanged>(_onCurrencyDataChanged);
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<UserDataChanged>(_onUserDataChanged);
    on<FavoriteCurrencyChanged>(_onFavoriteCurrencyChanged);
    on<HeldCurrencyListChanged>(_onHeldCurrencyListChanged);

    userSubscription = _authRepository.user.listen((user) {
      add(AppUserChanged(user: user));
    });

    currencyDataSubscription =
        _userDataRepository.getCurrencies().listen((currencyList) {
      final currencies = currencyList.docs
          .map((snapshot) {
            final data = (snapshot.data() ?? <String, dynamic>{})
                as Map<String, dynamic>;
            final metadaProvider = sampleCurrencyList.firstWhere(
              (currency) =>
                  (currency.symbol ?? '').toLowerCase().replaceAll('_', '') ==
                  snapshot.id.toLowerCase().replaceAll('_', ''),
              orElse: () => Currency.empty,
            );
            if (metadaProvider == Currency.empty) {
              // print(snapshot.id);
              return Currency.empty;
            }
            data['symbol'] = metadaProvider.symbol;
            data['name'] = metadaProvider.name ?? Currency.empty.name;
            data['image'] = metadaProvider.image ?? Currency.empty.image;
            data['marketCap'] =
                metadaProvider.marketCap ?? Currency.empty.marketCap;
            data['marketCapRank'] =
                metadaProvider.marketCapRank ?? Currency.empty.marketCapRank;
            data['priceChangePercentage24h'] =
                metadaProvider.priceChangePercentage24h ??
                    Currency.empty.priceChangePercentage24h;
            data['marketCapChangePercentage24h'] =
                metadaProvider.marketCapChangePercentage24h ??
                    Currency.empty.marketCapChangePercentage24h;
            final value = Currency.fromJson(data);
            return value;
          })
          .where(
            (element) => element != Currency.empty,
          )
          .toList()
        ..sort((a, b) => b.price!.compareTo(a.price!));
      add(
        CurrencyDataChanged(currencies: currencies),
      );
    });
  }
  final AuthRepository _authRepository;
  final UserDataRepository _userDataRepository;

  late final StreamSubscription<User> userSubscription;
  late final StreamSubscription<QuerySnapshot> currencyDataSubscription;
  late final StreamSubscription? _userDataStreamSubscription;

  void _onCurrencyDataChanged(
      CurrencyDataChanged event, Emitter<AppState> emit) {
    try {
      if (event.currencies.isNotEmpty) {
        emit(
          AppState._(
            status: state.status,
            user: state.user,
            currencies: event.currencies,
          ),
        );
      }
    } catch (e) {}
  }

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    try {
      if (event.user.isNotEmpty) {
        _userDataStreamSubscription = _userDataRepository
            .getUserData(event.user.id)
            .listen((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.data() != null) {
            final data = documentSnapshot.data()! as Map<String, dynamic>;
            add(
              UserDataChanged(
                userData: UserData.fromJson(data),
                user: event.user,
              ),
            );
          }
        });
      }
    } catch (e) {}
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user, state.currencies)
        : AppState.unauthenticated(state.currencies));
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.logout());
    unawaited(_userDataStreamSubscription?.cancel());
  }

  void _onUserDataChanged(UserDataChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(
            event.user.copyWith(data: event.userData),
            state.currencies,
          )
        : AppState.unauthenticated(state.currencies));
  }

  void _onFavoriteCurrencyChanged(
      FavoriteCurrencyChanged event, Emitter<AppState> emit) {
    unawaited(_userDataRepository.setFavoriteCurrency(
        event.user.id, event.favoriteCurrencySymbol));
  }

  Future<void> _onHeldCurrencyListChanged(
      HeldCurrencyListChanged event, Emitter<AppState> emit) async {
    final success = await _userDataRepository.setHeldCurrencyList(
        event.user.id, event.heldCurrencyList);
    if (!success) {
      // error dialog
    }
  }

  bool isUserLoggedIn() => state.user.isNotEmpty;

  bool isFavorite(Currency currency) =>
      currency.symbol ==
      (state.user.data ?? UserData.empty).favoriteCurrencySymbol;

  double getHeldValue(Currency currency) {
    final matches = state.user.data?.heldCurrencyList
        ?.where((element) => element.symbol == currency.symbol);
    if (matches == null || matches.isEmpty) return 0;
    return matches.first.value;
  }
}
