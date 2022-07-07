import 'package:flutter/material.dart';

class RegularCurrencyThumbnail extends StatelessWidget {
  const RegularCurrencyThumbnail({
    Key? key,
    required this.imageSize,
    required this.image,
  }) : super(key: key);

  final double imageSize;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: Image.network(image),
    );
  }
}
