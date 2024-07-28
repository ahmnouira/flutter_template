import 'package:flutter/material.dart';
import 'package:flutter_template/src/assets/assets.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_svg.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class AppDropdown<T> extends PopupMenuEntry<T> {
  final T value;
  final String text;
  final Function? callback;

  const AppDropdown({
    super.key,
    required this.text,
    required this.callback,
    required this.value,
  });

  @override
  State<AppDropdown<T>> createState() => _AppDropdown<T>();

  @override
  double get height => AppSizes.xxxl;

  @override
  bool represents(T? value) => this.value == value;
}

class _AppDropdown<T> extends State<AppDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 120),
      child: InkWell(
        onTap: () => Navigator.of(context).pop<T>(widget.value),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.xs),
          child: ListTile(
            title: AppText.v14(
              text: widget.text,
              color: Colors.grey.shade600,
            ),
            trailing: GestureDetector(
              onTap: () {
                if (widget.callback != null) {
                  widget.callback!();
                }
              },
              child: const AppSvg(
                path: Assets.dismissIcon,
                color: Colors.grey,
                label: 'Back',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
