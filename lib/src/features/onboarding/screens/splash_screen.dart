import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/src/app_navigator.dart';
import 'package:flutter_template/src/features/auth/services/auth_service.dart';
import 'package:flutter_template/src/features/auth/services/user_service.dart';
import 'package:flutter_template/src/providers/auth_provider.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/ui/widgets/app_hero.dart';
import 'package:flutter_template/src/ui/widgets/app_loading.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';
import 'package:flutter_template/src/utils/screen.dart';
import 'package:flutter_template/src/utils/timer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    checkUer();
  }

  Future<void> checkUer() async {
    final auth = AuthService();
    if (auth.isLoggedIn) {
      final user = await UserService().get(auth.user!.uid);
      print(user);
      if (user.hasAccessAdmin || user.hasAccessUser) {
        wait(() async {
          final provider = AppAuthProvider.of(context);
          await provider.login(user);
          wait(() {
            setState(() {
              _loading = false;
            });
            AppNavigator.mainTab(context);
          });
        });
      } else {
        wait(() {
          setState(() {
            _loading = false;
          });
          AppNavigator.login(context);
          // To quick test a screen

          // AppNavigator.requestAccess(context, uid: user.id);
        });
      }
    } else {
      wait(() {
        setState(() {
          _loading = false;
        });
        AppNavigator.login(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: checkUer,
        child: Container(
          height: Screen.height,
          width: Screen.width,
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppHero(
                width: 290,
                height: 280,
              ),
              const AppVSpace(),
              if (_loading)
                const AppLoading(
                  color: AppColors.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
