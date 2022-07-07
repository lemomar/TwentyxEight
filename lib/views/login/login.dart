import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubits.dart';
import '../../shared/shared.dart';
import '../views.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final mainColor = colorScheme.primary;
    return AuthWrapper(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
              child: const Text(
                'Log in',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 35, left: 20, right: 30),
              child: Column(
                children: <Widget>[
                  EmailInput(color: mainColor),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordInput(color: mainColor),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute<LoginView>(
                          builder: (context) => const SignupView(),
                        ),
                      ),
                      child: Text(
                        "I don't have an account",
                        style: TextStyle(color: mainColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  AuthButton(
                    color: mainColor,
                    text: 'Log in',
                    onPressed: () => context.read<LoginCubit>().login(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CancelAuthButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
