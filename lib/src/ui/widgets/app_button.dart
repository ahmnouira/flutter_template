import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_colors.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';
import 'package:eco_pat/src/ui/widgets/app_loading.dart';
import 'package:eco_pat/src/ui/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool loading;
  final void Function()? onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.primary),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.xs)),
          )),
        ),
        clipBehavior: Clip.antiAlias,
        child: loading
            ? const AppLoading()
            : AppText.v23(
                text: text,
                color: Colors.white,
              ),
      ),
    );
  }
}
