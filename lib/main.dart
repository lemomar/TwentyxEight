import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/app/app_bloc.dart';
import 'firebase_options.dart';
import 'repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // ignore: avoid_dynamic_calls
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ignore: unused_local_variable
  runApp(TwentyXEight());
}

class TwentyXEight extends StatelessWidget {
  TwentyXEight({super.key}) : _authRepository = AuthRepository();

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(authRepository: _authRepository),
          )
        ],
        child: Container(),
      ),
    );
  }
}
