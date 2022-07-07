import 'package:flutter/material.dart';

import '../signup/signup.dart';

class LoggedOutView extends StatelessWidget {
  const LoggedOutView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'You need to login first before accessing your wallet.',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () => showDialog<SignupView>(
                useSafeArea: false,
                context: context,
                builder: (context) => const SignupView(),
              ),
              child: const Text(
                'Login',
              ),
            )
          ],
        ),
      ),
    );
  }
}
