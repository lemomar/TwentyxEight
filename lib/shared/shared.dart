import 'package:flutter/material.dart';

export './components/components.dart';
export './data/crypto_names.dart';
export './theme/theme.dart';
export './utils/utils.dart';

const Set<MaterialState> interactiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};
const homeTabs = [
  Padding(
    padding: EdgeInsets.only(right: 8),
    child: Tab(text: 'Cryptocurrencies'),
  ),
  Padding(
    padding: EdgeInsets.only(left: 8),
    child: Tab(text: 'Stocks'),
  ),
];
