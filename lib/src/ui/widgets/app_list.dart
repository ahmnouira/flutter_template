import 'package:flutter/material.dart';

class AppList<T> extends StatelessWidget {
  final List<T> items;

  final Axis scrollDirection;

  final Widget? Function(T item, int index) render;

  const AppList({
    super.key,
    required this.items,
    required this.render,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        final item = items[index];

        return render(item, index);
      },
    );
  }
}
