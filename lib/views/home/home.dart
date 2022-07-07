import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../shared/shared.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencies = context.watch<AppBloc>().state.currencies;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              // const TopBar(),
              Header(
                'Home',
                actions: [TopBarIcon(onPressed: () {}, icon: const Icon(Icons.person))],
              ),

              const SizedBox(height: 16),
              const HomeTabBar(tabs: homeTabs),
              const FavoriteCurrencyCard(),
              const SubHeader('Trending'),
              Expanded(
                child: Card(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ...currencies.map(CurrencyCard.new),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
