import 'package:flutter/material.dart';
import 'package:flutter_template/src/app_navigator.dart';
import 'package:flutter_template/src/assets/assets.dart';
import 'package:flutter_template/src/features/auth/ui/auth_page_widget.dart';
import 'package:flutter_template/src/features/auth/ui/title_widget.dart';
import 'package:flutter_template/src/providers/auth_provider.dart';
import 'package:flutter_template/src/ui/snackbar/snackbar.dart';
import 'package:flutter_template/src/ui/widgets/app_button.dart';
import 'package:flutter_template/src/ui/widgets/app_hero.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';
import 'package:flutter_template/src/utils/timer.dart';

import '../services/user_service.dart';

class RequestAccessScreen extends StatefulWidget {
  final String uid;

  const RequestAccessScreen({super.key, required this.uid});

  @override
  State<RequestAccessScreen> createState() => _RequestAccessScreenState();
}

class _RequestAccessScreenState extends State<RequestAccessScreen> {
  bool _submitting = false;

  Future<void> _onSubmit() async {
    final userService = UserService();
    try {
      final user = await userService.get(widget.uid);
      if (user.hasAccessAdmin || user.hasAccessBerger) {
        wait(() async {
          final provider = AppAuthProvider.of(context);
          await provider.login(user);
          wait(() {
            setState(() {
              _submitting = false;
            });
            AppNavigator.mainTab(context);
          });
        });
      } else {
        wait(() {
          snackBarError(
            context,
            content: 'Wait for admin approval',
          );
        });
      }
    } catch (e) {
      setState(() {
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageWidget(simple: true, center: true, children: [
      const AppHero(
        image: Assets.success,
        height: 100,
        width: 100,
      ),
      const AppVSpace(),
      const TitleWidget(
        text: 'Permission',
        subtitle: 'Wait for admin permission',
      ),
      const AppVSpace.x2(),
      AppButton(
        text: 'Verify',
        onPressed: _onSubmit,
        loading: _submitting,
      ),
    ]);
  }
}
