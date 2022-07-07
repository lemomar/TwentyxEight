import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../shared/shared.dart';
import '../views.dart';

class WalletView extends StatelessWidget {
  const WalletView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = context.watch<AppBloc>();
    final appState = appBloc.state;
    final isUserLoggedIn = appState.status == AppStatus.authenticated;
    final heldCurrencyList = appBloc.state.user.data?.heldCurrencyList;
    final userHasNoCurrencies = heldCurrencyList == null || heldCurrencyList.isEmpty;
    final currencies = appBloc.state.currencies;
    if (!isUserLoggedIn) return const LoggedOutView();
    final heldCurrencies = currencies
        .where(
          (element) => (heldCurrencyList ?? []).any((element1) => element.symbol == element1.symbol),
        )
        .toList();
    return DefaultTabController(
      length: 2,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Header(
                'Wallet',
                actions: [
                  TopBarIcon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                    ),
                  ),
                  IconButton(
                    onPressed: () => appBloc.add(AppLogoutRequested()),
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              HeldCurrencyListCard(
                currencies: heldCurrencies,
                userHasNoCurrencies: userHasNoCurrencies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
