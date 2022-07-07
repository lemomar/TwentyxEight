import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../blocs/blocs.dart';
import '../../../../models/models.dart';
import '../../../shared.dart';

class CurrentValueHeldEditDialog extends HookWidget {
  const CurrentValueHeldEditDialog({
    Key? key,
    required this.symbol,
  }) : super(key: key);

  final String symbol;
  @override
  Widget build(BuildContext context) {
    // ignore: omit_local_variable_types
    final ValueNotifier<double> newValue = useState(0);
    final bloc = context.watch<AppBloc>();
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Header(
                    'Edit current held value',
                    actions: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Value',
                      hintText: 'Enter current held value',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      newValue.value = double.parse(value);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final newCurrency = [
                        if (newValue.value > 0)
                          HeldCurrency(
                            value: newValue.value,
                            symbol: symbol,
                          )
                      ];
                      bloc.add(
                        HeldCurrencyListChanged(
                          heldCurrencyList: [
                            ...?bloc.state.user.data?.heldCurrencyList?.where((element) => element.symbol != symbol),
                            ...newCurrency,
                          ],
                          user: bloc.state.user,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Edit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
