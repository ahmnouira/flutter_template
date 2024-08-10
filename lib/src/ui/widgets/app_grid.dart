import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';

enum AppGridType { fixedCrossAxis, maxCrossAxis }

class AppGrid<T> extends StatelessWidget {
  final List<T> items;
  final Widget? Function(T item, int index) builder;
  final AppGridType type;
  final EdgeInsetsGeometry padding;
  final int crossAxisCount;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double maxCrossAxisExtent;
  final ScrollController? controller;

  const AppGrid(
      {super.key,
      required this.items,
      required this.builder,
      this.controller,
      this.crossAxisCount = 2,
      this.childAspectRatio = 3 / 5,
      this.crossAxisSpacing = 0,
      this.mainAxisSpacing = 0,
      this.maxCrossAxisExtent = 500,
      this.type = AppGridType.fixedCrossAxis,
      this.padding = const EdgeInsets.only(right: 8, left: 8),
      this.physics,
      this.primary,
      this.shrinkWrap = false});

  const AppGrid.nested({
    super.key,
    required this.items,
    required this.builder,
    this.controller,

    /// Lets Flutter know that isn't the primary scroll view.
    this.primary = false,

    /// To create a fixed-length scrollable list of items,
    ///  This gives it a fixed height
    this.shrinkWrap = true,

    /// Disable the scrolling for this list view.
    /// That will propagate up to the list view
    this.physics = const NeverScrollableScrollPhysics(),
    this.crossAxisCount = 2,
    this.childAspectRatio = 3 / 5,
    this.crossAxisSpacing = 0,
    this.mainAxisSpacing = 0,
    this.maxCrossAxisExtent = 500,
    this.type = AppGridType.fixedCrossAxis,
    this.padding = const EdgeInsets.only(right: 8, left: 8),
  });

  SliverGridDelegate _getGridDelegate() {
    if (type == AppGridType.maxCrossAxis) {
      return SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisExtent, mainAxisExtent: 174);
    } else {
      return SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisExtent: 174);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      gridDelegate: _getGridDelegate(),
      itemBuilder: (context, index) => builder(items[index], index),
      itemCount: items.length,
      shrinkWrap: shrinkWrap,
      primary: primary,
      physics: physics,
      padding: const EdgeInsets.all(AppSizes.xs),
    );
  }
}
