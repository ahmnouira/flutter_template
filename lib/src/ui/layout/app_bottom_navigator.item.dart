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
    name: 'Mon troupeau',
    image: Assets.liveStockIcon,
    icon: Icon(Icons.pets),
  ),
  AppBottomNavigatorMenu(
    name: 'Mon profil',
    image: Assets.profileIcon,
    icon: Icon(Icons.person),
  ),
];

final List<AppBottomNavigatorMenu> userMenu = [
  sharedMenu.first,
  AppBottomNavigatorMenu(
      image: Assets.addIcon, name: 'Rapport', icon: Icon(Icons.notes)),
  sharedMenu.last
];

final List<AppBottomNavigatorMenu> adminMenu = [
  sharedMenu.first,
  AppBottomNavigatorMenu(
      image: Assets.addIcon, name: 'Ajouter', icon: Icon(Icons.add_box)),
  AppBottomNavigatorMenu(
      image: Assets.addIcon, name: 'Rapport', icon: Icon(Icons.notes)),
  sharedMenu.last
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
