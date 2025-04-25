import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter/material.dart';

class AppListSeparated<T> extends StatelessWidget {
  final ScrollController? controller;
  final List<T> list;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;

  final Widget? Function(T item, int index) builder;
  final Axis scrollDirection;

  const AppListSeparated({
    super.key,
    required this.list,
    required this.builder,
    this.controller,
    this.shrinkWrap = false,
    this.primary,
    this.physics,
    this.padding = const EdgeInsets.all(8),
    this.scrollDirection = Axis.horizontal,
  });

  const AppListSeparated.nested({
    super.key,
    required this.list,
    required this.builder,
    this.controller,
    this.padding = const EdgeInsets.all(8),

    /// Lets Flutter know that isn't the primary scroll view.
    this.primary = false,

    /// To create a fixed-length scrollable list of items,
    ///  This gives it a fixed height
    this.shrinkWrap = true,

    /// Disable the scrolling for this list view.
    /// That will propagate up to the list view
    this.physics = const NeverScrollableScrollPhysics(),
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      primary: false,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) => builder(list[index], index),
      separatorBuilder: (context, index) {
        return SizedBox(
          height: scrollDirection == Axis.vertical ? AppSizes.xss : null,
          width: scrollDirection == Axis.horizontal ? AppSizes.xss : null,
        );
      },
      itemCount: list.length,
    );
  }
}
