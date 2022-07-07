import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(
    this.text, {
    Key? key,
    this.actions,
  }) : super(key: key);

  final String text;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
