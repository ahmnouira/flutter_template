import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_hero.dart';

import 'app_text.dart';

Widget buildTitle(String title) {
  return AppText(
    text: title,
    overflow: TextOverflow.ellipsis,
  );
}

List<Widget> buildActions() {
  return [
    PopupMenuButton(
      icon: const Icon(Icons.menu),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          onTap: () => {},
          child: const AppText.v16(
            text: 'Add',
          ),
        ),
      ],
    ),
  ];
}

class AppLayout {
  static AppBar buildSimpleAppBar(String title, {void Function()? onPressed}) {
    return AppBar(
      title: buildTitle(title),
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 0,
      leading:
          IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back)),
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

  AppBar buildWhiteAppBar(String title) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 1.0,
      title: buildTitle(title),
      leading: const AppHero(),
    );
  }

  static AppBar buildAppBar(
    String title,
  ) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
      centerTitle: true,
      //  actions: hasCreateAccess ? buildActions() : [],
      title:
          // AppBarSearch(),
          buildTitle(title),
    );
  }

  static AppBar buildAppBarForDrawer() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppColors.grey,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }
}
