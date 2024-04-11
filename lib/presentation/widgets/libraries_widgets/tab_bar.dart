import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: <Widget>[
        Tab(
          text: 'Most popular packages',
        ),
        Tab(
          text: 'Newest packages',
        ),
      ],
    );
  }
}
