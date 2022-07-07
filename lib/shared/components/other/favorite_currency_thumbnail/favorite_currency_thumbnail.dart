import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../shared.dart';

class FavoriteCurrencyThumbnail extends StatelessWidget {
  const FavoriteCurrencyThumbnail({
    Key? key,
    required this.imageSize,
    required this.favoriteCurrency,
  }) : super(key: key);

  final double imageSize;
  final Currency? favoriteCurrency;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RegularCurrencyThumbnail(
          imageSize: imageSize,
          image: favoriteCurrency?.image ?? '',
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: darken(Theme.of(context).colorScheme.secondary, .8).withOpacity(.5),
            child: Center(
              child: Icon(
                size: 12,
                Icons.favorite,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
