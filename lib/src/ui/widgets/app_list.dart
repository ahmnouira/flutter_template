import 'package:flutter/material.dart';

class AppList<T> extends StatelessWidget {
  final List<T> items;
  final Axis scrollDirection;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  final ScrollController? controller;

  final Widget? Function(T item, int index) builder;

  const AppList({
    super.key,
    required this.items,
    required this.builder,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.primary = true,
    this.physics,
    this.controller,
  });

  const AppList.nested({
    super.key,
    required this.items,
    required this.builder,

    /// Lets Flutter know that isn't the primary scroll view.
    this.primary = false,

    /// To create a fixed-length scrollable list of items,
    ///  This gives it a fixed height
    this.shrinkWrap = true,

    /// Disable the scrolling for this list view.
    /// That will propagate up to the list view
    this.physics = const NeverScrollableScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: items.length,
      primary: primary,
      controller: controller,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) => builder(items[index], index),
    );
  }
}
