import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/blocs.dart';
import '../../../../models/models.dart';
import '../../../shared.dart';
import '../../typography/typography.dart';

class FavoriteCurrencyCard extends StatelessWidget {
  const FavoriteCurrencyCard({
    Key? key,
  }) : super(key: key);

  static const double imageSize = 48;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AppBloc>();
    final data = bloc.state.currencies
        .where((Currency currency) =>
            (bloc.state.user.data ?? UserData.empty).favoriteCurrencySymbol ==
            currency.symbol)
        .toList();
    final favoriteCurrency = data.isNotEmpty ? data.first : null;
    final isUserLoggedIn = bloc.state.user.isNotEmpty;
    if (!isUserLoggedIn) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SubHeader('Favorite Currency'),
          SizedBox(
            height: 120,
            child: Center(
              child: Text('Please log in in order to set a favorite currency'),
            ),
          ),
        ],
      );
    }
    if (favoriteCurrency == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SubHeader('Favorite Currency'),
          SizedBox(
            height: 120,
            child: Center(
              child: Text('Please add a favorite currency first.'),
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SubHeader(favoriteCurrency.name ?? Currency.empty.name!),
        SizedBox(
          height: 124,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FavoriteWidgetDetails(favoriteCurrency: favoriteCurrency),
                      FavoriteCurrencyThumbnail(
                          imageSize: imageSize,
                          favoriteCurrency: favoriteCurrency),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
