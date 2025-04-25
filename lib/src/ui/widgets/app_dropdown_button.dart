import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';
import 'package:flutter_template/src/theme/app_sizes.dart';
import 'package:flutter_template/src/ui/widgets/app_list.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';
import 'package:flutter_template/src/ui/widgets/app_text_field_base.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';
import 'package:flutter_template/src/utils/screen.dart';

class AppDropdownButton<T extends Object> extends StatefulWidget {
  final TextEditingController controller;
  final List<T> list;
  final void Function(dynamic value)? onSelect;
  final String? placeholder;
  final String? label;
  final String? value;
  final bool smaller;

  const AppDropdownButton({
    super.key,
    this.placeholder,
    required this.controller,
    required this.onSelect,
    this.value,
    this.list = const [],
    this.label,
    this.smaller = false,
  });

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  bool _show = false;

  void _toggleShow() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    final value = widget.controller.text;
    final canSelect = widget.onSelect != null;

    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null && widget.label!.isNotEmpty)
            AppText.v16(
              text: widget.label!,
              padding: const EdgeInsets.only(bottom: AppSizes.xs),
            ),
          AppTextFieldBase(
            controller: widget.controller,
            onTap: _toggleShow,
            enabled: canSelect,
            suffixIcon: InkWell(
              onTap: _toggleShow,
              child: Icon(
                _show
                    ? Icons.arrow_drop_up_outlined
                    : Icons.arrow_drop_down_outlined,
                color: Colors.black54,
              ),
            ),
          ),
          if (_show && canSelect)
            Column(
              children: [
                const AppVSpace(
                  height: AppSizes.xs,
                ),
                Container(
                  width: Screen.width,
                  height: widget.list.length * 44 > Screen.height / 2
                      ? 4 * 44
                      : widget.list.length * 44,
                  decoration: BoxDecoration(
                    color: AppColors.textField,
                    border: Border.all(color: AppColors.textFieldBorder),
                    borderRadius: BorderRadius.circular(AppSizes.xs),
                  ),
                  child: AppList(
                    items: widget.list,
                    primary: false,
                    builder: (item, index) {
                      final selected = value == item;

                      return Container(
                        color: AppColors.textField,
                        child: ListTile(
                          onTap: () {
                            widget.onSelect!(item);
                            setState(() {
                              _show = false;
                            });
                          },
                          title: AppText(
                            text: item.toString(),
                            fontSize: widget.smaller ? 15 : 18,
                            color:
                                selected ? AppColors.primary : AppColors.black,
                            fontWeight:
                                selected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
