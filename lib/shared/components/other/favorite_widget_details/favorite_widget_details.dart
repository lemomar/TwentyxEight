import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/blocs.dart';
import '../../../../models/models.dart';
import '../../../shared.dart';

class FavoriteWidgetDetails extends StatelessWidget {
  const FavoriteWidgetDetails({
    Key? key,
    required this.favoriteCurrency,
  }) : super(key: key);

  final Currency favoriteCurrency;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AppBloc>();
    final priceChangePercentage = favoriteCurrency.priceChangePercentage24h ?? Currency.empty.priceChangePercentage24h!;
    final priceChangeIsPositive = priceChangePercentage > 0;
    final priceChange = priceChangePercentage.abs().toStringAsFixed(4);
    final priceChangePrefix = priceChangeIsPositive ? '▲ ' : '▼ ';

    final heldValue = bloc.getHeldValue(favoriteCurrency);
    final symbol = favoriteCurrency.symbol ?? Currency.empty.symbol!;
    final price = favoriteCurrency.price ?? Currency.empty.price!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${symbol.toUpperCase()} $heldValue',
              // overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            IconButton(
              onPressed: () => showDialog<Widget>(
                barrierDismissible: true,
                useSafeArea: false,
                context: context,
                builder: (context) => CurrentValueHeldEditDialog(symbol: symbol),
              ),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 16,
            ),
            children: [
              TextSpan(text: '€${(heldValue * price).toStringAsFixed(2)}'),
              TextSpan(
                text: ' ($priceChangePrefix ? %)',
                style: TextStyle(
                  color: priceChangeIsPositive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
