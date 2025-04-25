import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class ChipWidget extends StatelessWidget {
  final String title;

  final void Function(bool selected) onChange;

  final bool selected;

  const ChipWidget({
    super.key,
    required this.title,
    required this.onChange,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: AppColors.primary,
      backgroundColor: AppColors.chip,
      label: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.sm + 1)),
          ),
          child: Align(
            child: AppText.v14(
              text: title,
            ),
          )),
      onSelected: onChange,
      selected: selected,
    );
  }
}
