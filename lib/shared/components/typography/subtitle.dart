import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  const Subtitle(
    this.text, {
    Key? key,
    this.padding,
  }) : super(key: key);

  final String text;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? 8.0,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
