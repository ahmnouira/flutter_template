import 'package:flutter/material.dart';

import 'bottom_navigator.item.dart';

class BottomNavigatorWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  final List<BottomNavigatorItem>? items;

  const BottomNavigatorWidget({
    super.key,
    required this.currentIndex,
    this.onTap,
    this.items = const [],
  });

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    late List<BottomNavigatorItem> list;

    if (items!.isNotEmpty) {
      list = List.from(items!);
    } else {
      list = bottomNavigatorList;
    }

    return list
        .map(
          (item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
            tooltip: item.tooltip,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
      items: _buildBottomNavigationBarItem(),
    );
  }
}
