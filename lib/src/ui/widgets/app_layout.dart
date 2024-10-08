import 'package:flutter/material.dart';

import 'package:eco_pat/src/theme/app_colors.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';
import 'package:eco_pat/src/ui/widgets/app_hero.dart';
import 'app_text.dart';

Widget buildTitle(String title) {
  return AppText(
    text: title,
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );
}

class AppLayout {
  const AppLayout();

  static AppBar buildSimpleAppBar(BuildContext context, String title) {
    return AppBar(
      title: buildTitle(title),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        iconSize: 30,
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  static AppBar buildTransparentAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: buildTitle(title),
      leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: AppHero()),
    );
  }

  static AppBar buildWhiteAppBar(String title) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 1.0,
      title: buildTitle(title),
      leading: const AppHero(),
    );
  }

  static AppBar buildAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // AppBarSearch(),
          buildTitle(title),
        ],
      ),
    );
  }
}
