import 'package:flutter/material.dart';
import 'package:flutter_template/src/features/profile/data/profile_service.dart';

import '../../features/items/screens/items_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../providers/app_state_provider.dart';

import 'app_bottom_navigator.dart';

final tabs = [
  const ItemsScreen(),
  const ProfileScreen(
    service: ProfileService(),
  ),
];

class MainTab extends StatelessWidget {
  const MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context, listen: true);

    return Scaffold(
      body: Container(
        child: tabs[provider.selectedTab],
      ),
      //  floatingActionButton: const FloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AppBottomNavigator(
        currentIndex: provider.selectedTab,
        onTap: provider.goToTab,
      ),
    );
  }
}
