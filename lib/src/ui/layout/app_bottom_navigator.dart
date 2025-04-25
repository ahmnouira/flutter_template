import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/src/theme/app_colors.dart';

import 'app_bottom_navigator.item.dart';

class AppBottomNavigator extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  final List<AppBottomNavigatorItem> items;

  const AppBottomNavigator({
    super.key,
    required this.currentIndex,
    required this.items,
    this.onTap,
  });

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    return items
        .map(
          (item) => BottomNavigationBarItem(
            icon: item.icon,
            label: item.label,
            tooltip: item.tooltip,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.unselected,
      currentIndex: currentIndex,
      onTap: onTap,
      unselectedLabelStyle: GoogleFonts.urbanist(
          color: AppColors.unselected,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      selectedLabelStyle: GoogleFonts.urbanist(
          color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w500),
      backgroundColor: AppColors.bottomNavigationBar,
      selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
      items: _buildBottomNavigationBarItem(),
    );
  }
}
