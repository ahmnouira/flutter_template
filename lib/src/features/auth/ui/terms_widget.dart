import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/ui/widgets/app_checkbox.dart';
import 'package:flutter_template/src/ui/widgets/app_link.dart';
import 'package:flutter_template/src/utils/links.dart';

class TermsWidget extends StatelessWidget {
  final bool checked;
  final void Function({required bool value}) onChanged;

  const TermsWidget({
    super.key,
    required this.checked,
    required this.onChanged,
  });

  Future<void> _handleClick() async {
    final links = Links();
    await links.terms();
  }

  @override
  Widget build(BuildContext context) {
    return AppCheckbox(
      value: checked,
      onChanged: (value) => onChanged(value: value),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppLink(
            text: 'Accept',
            color: AppColors.black,
          ),
          AppLink(
            text: 'Terms',
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
            onPressed: _handleClick,
          ),
        ],
      ),
    );
  }
}
