import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/cubits.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        late String message;
        switch (state.loginStatus) {
          case LoginStatus.userNotFound:
            message =
                'That user does not exist. Did you create an account yet?';
            break;
          case LoginStatus.error:
            message =
                'An error occured. Please check your credentials and try again';
            break;
          case LoginStatus.wrongPassword:
            message = 'The password you provided is invalid.';
            break;
          case LoginStatus.invalidEmail:
            message = 'The email address is badly formatted.';
            break;
          case LoginStatus.weakPassword:
            message = 'Password should be at least 6 characters.';
            break;
          case LoginStatus.success:
            message = 'Hi there!';
            break;
          case LoginStatus.submitted:
            message = 'Loading...';
            break;
          case LoginStatus.emailAlreadyInUse:
            message = 'That email is already in use, sorry.';
            break;
          case LoginStatus.initial:
            break;
        }
        if (state.loginStatus != LoginStatus.success) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
          return;
        }
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pop(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(child: child),
        ),
      ),
    );
  }
}
