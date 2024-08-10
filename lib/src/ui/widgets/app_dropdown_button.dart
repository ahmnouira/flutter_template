import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_colors.dart';
import 'package:eco_pat/src/theme/app_sizes.dart';
import 'package:eco_pat/src/ui/widgets/app_list.dart';
import 'package:eco_pat/src/ui/widgets/app_text.dart';
import 'package:eco_pat/src/ui/widgets/app_text_field_base.dart';

class AppDropdownButton extends StatefulWidget {
  final List<String> list;
  final void Function(String value) onSelect;
  final String? placeholder;
  final String? label;
  final TextEditingController controller;
  const AppDropdownButton({
    super.key,
    this.placeholder,
    required this.controller,
    required this.list,
    required this.onSelect,
    this.label,
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
                suffixIcon: InkWell(
                    onTap: _toggleShow,
                    child: Icon(
                      _show
                          ? Icons.arrow_drop_up_outlined
                          : Icons.arrow_drop_down_outlined,
                      color: Colors.black54,
                    ))),
            if (_show)
              SizedBox(
                height: widget.list.length * 44,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSizes.md),
                  child: AppList(
                      items: widget.list,
                      primary: false,
                      shrinkWrap: true,
                      builder: (item, index) {
                        final selected =
                            value.toLowerCase() == item.toLowerCase();
                        return ListTile(
                          onTap: () {
                            setState(() {
                              _show = false;
                            });
                            widget.onSelect(item);
                          },
                          title: AppText.v18(
                            text: item,
                            color:
                                selected ? AppColors.primary : AppColors.black,
                            fontWeight:
                                selected ? FontWeight.bold : FontWeight.normal,
                          ),
                        );
                      }),
                ),
              ),
          ],
        ));
  }
}
