import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../shared.dart';

class HeldCurrencyListCard extends StatelessWidget {
  const HeldCurrencyListCard({
    super.key,
    required this.currencies,
    this.userHasNoCurrencies = false,
  });

  final List<Currency> currencies;
  final bool userHasNoCurrencies;

  @override
  Widget build(BuildContext context) {
    if (userHasNoCurrencies) {
      return const Center(
        child: Text('Please add some currencies first'),
      );
    }
    return Card(
      child: ListView(
        shrinkWrap: true,
        children: [
          ...currencies.map(CurrencyCard.new),
        ],
      ),
    );
  }
}
