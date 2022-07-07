import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BNavigationBar extends StatelessWidget {
  const BNavigationBar({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ValueNotifier<int> state;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: state.value,
      onTap: (int index) => state.value = index,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      // unselectedItemColor: bottomBarSelectedColor.withOpacity(.4),
      items: [
        SalomonBottomBarItem(
          title: const Text('Home'),
          icon: const Icon(Icons.home),
        ),
        SalomonBottomBarItem(
          title: const Text('Portfolio'),
          icon: const Icon(Icons.wallet),
        ),
      ],
    );
  }
}
