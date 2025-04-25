import 'package:flutter/material.dart';
import 'package:flutter_template/src/assets/assets.dart';
import 'package:flutter_template/src/extensions/string_extension.dart';
import 'package:flutter_template/src/features/auth/ui/auth_page_widget.dart';
import 'package:flutter_template/src/features/auth/ui/title_widget.dart';
import 'package:flutter_template/src/features/profile/ui/profile_menu.dart';
import 'package:flutter_template/src/providers/auth_provider.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/ui/widgets/app_hero.dart';
import 'package:flutter_template/src/ui/widgets/app_page_future.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = AppAuthProvider.of(context, listen: true).user;

    return AppPageFuture(
      future: Future.value(user),
      backgroundColor: AppColors.white,
      drawer: Drawer(
        backgroundColor: AppColors.bottomNavigationBar,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppVSpace.x3(),
              const AppHero(
                tag: 'logo-drawer',
                image: Assets.logoDrawer,
              ),
              ProfileMenu(
                user: user,
              ),
              const AppVSpace(),
            ],
          ),
        ),
      ),
      builder: (user) {
        return AuthPageWidget(children: [
          const AppHero(),
          TitleWidget(
            text:
                'Bonjour${user.firstName.length > 1 ? ' ${user.firstName.capitalize()}' : ''} !',
            subtitle:
                "Bienvenue dans l'équipe des Bergers et Bergères des Moutons de l'Ouest. Nous sommes fiers de partager nos valeurs autour de l'écologie, du bien-être animal et de la satisfaction client : c’est ce qui nous animent au quotidien !\nPrends soin de tes bêtes et sois vigilant(e) sur la route",
          ),
        ]);
      },
    );
  }
}
