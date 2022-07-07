import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: const BoxDecoration(
        // color: Theme.of(context).colorScheme.background,
        color: Colors.transparent,
      ),
      child: TabBar(
        indicatorColor: Theme.of(context).colorScheme.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary,
        ),
        unselectedLabelStyle: const TextStyle(
          backgroundColor: Colors.transparent,
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        labelColor: Theme.of(context).colorScheme.onPrimary,
        tabs: tabs,
      ),
    );
  }
}
