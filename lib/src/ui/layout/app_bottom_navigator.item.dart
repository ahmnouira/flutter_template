import 'package:flutter/material.dart';
import 'package:flutter_template/src/assets/assets.dart';
import 'package:flutter_template/src/ui/widgets/app_hero.dart';

class AppBottomNavigatorItem {
  final Widget icon;
  final String? label;
  final String? tooltip;

  AppBottomNavigatorItem({required this.icon, this.label, this.tooltip});
}

class AppBottomNavigatorMenu {
  final String name;
  final String image;
  final Widget? icon;
  AppBottomNavigatorMenu({
    required this.name,
    required this.image,
    this.icon,
  });
}

final List<AppBottomNavigatorMenu> sharedMenu = [
  AppBottomNavigatorMenu(
    name: 'Items',
    image: Assets.liveStockIcon,
    icon: const Icon(
      Icons.list,
    ),
  ),
  AppBottomNavigatorMenu(
    name: 'Profile',
    image: Assets.profileIcon,
    icon: const Icon(
      Icons.person,
    ),
  ),
];

final List<AppBottomNavigatorMenu> userMenu = [
  sharedMenu.first,
  sharedMenu.last,
];

final List<AppBottomNavigatorMenu> adminMenu = [
  sharedMenu.first,
  sharedMenu.last,
];

List<AppBottomNavigatorItem> buildMenu(List<AppBottomNavigatorMenu> list) {
  return list
      .map(
        (item) => AppBottomNavigatorItem(
          icon: item.icon ??
              AppHero(
                height: 26,
                width: 26,
                image: item.image,
                tag: item.name,
              ),
          label: item.name,
        ),
      )
      .toList();
}

List<AppBottomNavigatorItem> bottomNavigatorList = buildMenu(userMenu);
List<AppBottomNavigatorItem> bottomNavigatorListAdmin = buildMenu(adminMenu);
