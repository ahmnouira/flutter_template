import 'package:flutter/material.dart';

class AppBottomNavigatorItem {
  final IconData icon;
  final String? label;
  final String? tooltip;

  AppBottomNavigatorItem({required this.icon, this.label, this.tooltip});
}

List<AppBottomNavigatorItem> bottomNavigatorList = [
  AppBottomNavigatorItem(
    icon: Icons.home,
    label: 'Items',
    tooltip: 'Explore Items',
  ),
  AppBottomNavigatorItem(
    icon: Icons.account_circle,
    label: 'Profile',
  ),
];
