import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/cubits.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          onChanged: (value) =>
              context.read<LoginCubit>().passwordChanged(value),
          decoration: InputDecoration(
            focusColor: color,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color),
              borderRadius: BorderRadius.circular(12),
            ),
            labelText: 'Password',
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
          ),
        );
      },
    );
  }
}
