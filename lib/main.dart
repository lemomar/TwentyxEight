import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'blocs/blocs.dart';
import 'firebase_options.dart';
import 'repositories/repositories.dart';
import 'shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: TwentyXEight(),
      theme: lightTheme,
      darkTheme: darkTheme,
    ),
  );
}

class TwentyXEight extends HookWidget {
  TwentyXEight({super.key}) : _authRepository = AuthRepository();

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    final bottomBarState = useState(0);
    return RepositoryProvider.value(
      value: _authRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(authRepository: _authRepository),
          ),
        ],
        child: Scaffold(
          bottomNavigationBar: BNavigationBar(state: bottomBarState),
          body: SafeArea(
            child: IndexedStack(
              index: bottomBarState.value,
              children: [
                Center(
                  child: Container(
                    color: Colors.blueGrey,
                    child: const Text('1', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.deepPurple,
                    child: const Text('2', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.lime,
                    child: const Text('3', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
