import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'blocs/blocs.dart';
import 'cubits/cubits.dart';
import 'firebase_options.dart';
import 'repositories/repositories.dart';
import 'shared/shared.dart';
import 'views/views.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authRepository = AuthRepository();
  final userDataRepository = UserDataRepository();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authRepository,
        ),
        RepositoryProvider.value(
          value: userDataRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authRepository: authRepository,
              userDataRepository: userDataRepository,
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(context.read<AuthRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const TwentyXEight(),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.dark,
        ),
      ),
    ),
  );
}

class TwentyXEight extends HookWidget {
  const TwentyXEight({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarState = useState(0);
    final bloc = context.watch<AppBloc>();
    final currencyValues = bloc.state.currencies;
    if (currencyValues.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      bottomNavigationBar: BNavigationBar(state: bottomBarState),
      body: SafeArea(
        child: IndexedStack(
          index: bottomBarState.value,
          children: const [
            HomeView(),
            WalletView(),
          ],
        ),
      ),
    );
  }
}
