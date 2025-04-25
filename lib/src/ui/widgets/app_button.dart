import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_loading.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool loading;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final bool secondary;

  const AppButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.loading = false,
      this.height = 63,
      this.width = double.infinity,
      this.secondary = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
              secondary ? AppColors.secondary : AppColors.primary),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.xs)),
          )),
        ),
        clipBehavior: Clip.antiAlias,
        child: loading
            ? const AppLoading()
            : AppText.v20(
                text: text,
                color: secondary ? AppColors.black : AppColors.white,
              ),
      ),
    );
  }
}
