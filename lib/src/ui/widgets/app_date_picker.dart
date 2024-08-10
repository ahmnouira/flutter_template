import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';
import 'package:eco_pat/src/ui/widgets/app_text.dart';
import 'package:eco_pat/src/ui/widgets/app_text_field_base.dart';
import 'package:eco_pat/src/utils/date.dart';

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
                  initialDate: DateTime.tryParse(controller.text) != null
                      ? DateTime.parse(controller.text)
                      : DateTime.now(),
                  firstDate: DateTime(currentDate.year - 10),
                  lastDate: DateTime(currentDate.year + 5),
                  // locale: const Locale('fr', 'FR'),
                );
                if (selectedDate != null) {
                  onSelect(Date.formatDateTime(selectedDate));
                }
              },
            ),
          ],
        ));
  }
}
