import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
