import 'package:flutter/material.dart';
import 'package:eco_pat/src/assets/assets.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';
import 'package:eco_pat/src/ui/widgets/app_h_space.dart';
import 'package:eco_pat/src/ui/widgets/app_text.dart';

class AppGoogleButton extends StatelessWidget {
  final void Function() onPressed;

  const AppGoogleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: OutlinedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.xs)),
          )),
        ),
        child: Row(
          children: [
            Image.asset(Assets.googleIcon),
            const AppHSpace(),
            const AppText.v23(
              text: 'Google',
            ),
          ],
        ),
      ),
    );
  }
}
