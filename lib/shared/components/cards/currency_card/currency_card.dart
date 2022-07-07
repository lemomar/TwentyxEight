import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/blocs.dart';
import '../../../../models/models.dart';
import '../../../shared.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard(this.currency, {super.key});
  final Currency currency;
  static const double imageSize = 36;

  @override
  Widget build(BuildContext context) {
    final priceChangePercentage = currency.priceChangePercentage24h ?? Currency.empty.priceChangePercentage24h!;
    final priceChangeIsPositive = priceChangePercentage > 0;
    final priceChange = priceChangePercentage.abs().toStringAsFixed(4);
    final priceChangePrefix = priceChangeIsPositive ? '▲ ' : '▼ ';
    final bloc = context.watch<AppBloc>();
    final isFavorite = bloc.isFavorite(currency);
    return ListTile(
      onTap: () => showDialog<Widget>(
        barrierDismissible: true,
        useSafeArea: false,
        context: context,
        builder: (context) => CurrentValueHeldEditDialog(symbol: currency.symbol ?? ''),
      ),
      title: Text(currency.name ?? ''),
      leading: isFavorite
          ? FavoriteCurrencyThumbnail(imageSize: imageSize, favoriteCurrency: currency)
          : RegularCurrencyThumbnail(
              imageSize: imageSize,
              image: currency.image ?? '',
            ),
      subtitle: Text((currency.symbol ?? '').toUpperCase()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$priceChangePrefix ? %',
                style: TextStyle(
                  color: priceChangeIsPositive ? Colors.green : Colors.red,
                ),
              ),
              Text('€ ${currency.price.toString()}'),
            ],
          ),
          if (bloc.isUserLoggedIn())
            IconButton(
              onPressed: () {
                final newFavorite = isFavorite ? null : currency.symbol;
                bloc.add(FavoriteCurrencyChanged(favoriteCurrencySymbol: newFavorite, user: bloc.state.user));
              },
              icon: Stack(
                children: [
                  Icon(
                    Icons.favorite,
                    color: isFavorite ? Theme.of(context).colorScheme.secondary : Colors.transparent,
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: darken(Theme.of(context).colorScheme.primary, .9),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
