import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../shared.dart';

class CurrencyThumbnail extends StatelessWidget {
  const CurrencyThumbnail({
    super.key,
    required this.isFavorite,
    required this.currency,
    required this.imageSize,
  });

  final bool isFavorite;
  final Currency currency;
  final double imageSize;

  @override
  Widget build(BuildContext context) => isFavorite
      ? FavoriteCurrencyThumbnail(
          imageSize: imageSize, favoriteCurrency: currency)
      : RegularCurrencyThumbnail(
          imageSize: imageSize,
          image: currency.image ?? '',
        );
}
