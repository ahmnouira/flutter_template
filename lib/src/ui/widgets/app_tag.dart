import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_colors.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';
import 'package:eco_pat/src/ui/widgets/app_text.dart';

class AppTag extends StatelessWidget {
  final String title;
  final void Function(String selected) onChange;
  final bool selected;

  const AppTag({
    super.key,
    required this.title,
    required this.onChange,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange(title),
      child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.sm,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary2 : AppColors.chip,
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSizes.sm + 1)),
          ),
          child: Align(
            child: AppText.v14(
              text: title,
              color: selected ? AppColors.white : AppColors.black,
            ),
          )),
    );
  }
}
