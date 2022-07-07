import 'package:flutter/material.dart';

class TopBarIcon extends StatelessWidget {
  const TopBarIcon({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final Null Function() onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 40,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
