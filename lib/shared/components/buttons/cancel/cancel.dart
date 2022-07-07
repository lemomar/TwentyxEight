import 'package:flutter/material.dart';

import '../../../shared.dart';

class CancelAuthButton extends StatelessWidget {
  const CancelAuthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text(
        'Go Back',
        style: TextStyle(
          color: lighten(Theme.of(context).colorScheme.onTertiary, .3),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
