import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/dialogs/dialog_button.dart';
import 'package:flutter_template/src/ui/widgets/app_h_space.dart';
import 'package:flutter_template/src/ui/widgets/app_hero.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';

class Dialogs {
  Widget buildDialog(
    String title,
    String image, {
    required Future<void> Function() onPressed,
    required Function() onBack,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.xs),
      ),
      elevation: 1,
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        AppHero(
          height: 160,
          width: 120,
          image: image,
        ),
        AppText.v20(
          text: title,
          color: AppColors.black,
          fontWeight: FontWeight.w900,
          textAlign: TextAlign.center,
        ),
        const AppVSpace(),
        Row(
          children: [
            DialogButton(
              text: 'Yes',
              onPressed: onPressed,
            ),
            const AppHSpace(
              width: AppSizes.xs,
            ),
            DialogButton(
              text: 'No',
              secondary: true,
              onPressed: onBack,
            ),
          ],
        ),
      ]),
    );
  }
}
