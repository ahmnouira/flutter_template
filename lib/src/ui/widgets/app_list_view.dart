import 'package:flutter/material.dart';

class AppListView<T> extends StatelessWidget {
  final List<Widget> children;
  final Axis scrollDirection;
  final ScrollController? controller;

  const AppListView({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.controller,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      scrollDirection: scrollDirection,
      children: children,
    );
  }
}
