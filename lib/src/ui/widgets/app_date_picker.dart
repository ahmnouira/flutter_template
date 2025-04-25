import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';
import 'package:flutter_template/src/ui/widgets/app_text_field_base.dart';
import 'package:flutter_template/src/utils/date.dart';
import 'package:flutter/material.dart';

class AppDatePicker extends StatelessWidget {
  final void Function(String value) onSelect;
  final String? placeholder;
  final String? label;
  final TextEditingController controller;
  const AppDatePicker({
    super.key,
    this.placeholder,
    required this.controller,
    required this.onSelect,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null && label!.isNotEmpty)
              AppText.v16(
                text: label!,
                padding: const EdgeInsets.only(bottom: AppSizes.xs),
              ),
            AppTextFieldBase(
              controller: controller,
              onTap: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: Date().parse(controller.text),
                  firstDate: DateTime(currentDate.year - 10),
                  lastDate: DateTime(currentDate.year + 5),
                  locale: const Locale('fr', 'FR'),
                  builder: (context, child) => Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColors.primary,
                        ),
                        buttonTheme: const ButtonThemeData(
                          colorScheme: ColorScheme.light(
                            primary: AppColors.primary,
                          ),
                        ),
                      ),
                      child: child!),
                );
                if (selectedDate != null) {
                  onSelect(Date().format(selectedDate));
                }
              },
            ),
          ],
        ));
  }
}
