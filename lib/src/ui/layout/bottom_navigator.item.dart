import 'package:flutter/material.dart';

class BottomNavigatorItem {
  final IconData icon;
  final String? label;
  final String? tooltip;

  BottomNavigatorItem({required this.icon, this.label, this.tooltip});
}

List<BottomNavigatorItem> bottomNavigatorList = [
  BottomNavigatorItem(
    icon: Icons.home,
    label: 'Items',
    tooltip: 'Explore Items',
  ),
  BottomNavigatorItem(
    icon: Icons.account_circle,
    label: 'Profile',
  ),
];
