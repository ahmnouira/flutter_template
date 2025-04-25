import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';
import 'package:flutter_template/src/ui/widgets/chips/chip_widget.dart';

class ChipItem {
  final String title;
  final bool selected;
  final void Function(bool selected) onChange;

  const ChipItem({
    required this.title,
    required this.selected,
    required this.onChange,
  });
}

class ChipsGroup extends StatelessWidget {
  final List<ChipItem> items;
  final String title;

  const ChipsGroup({
    super.key,
    required this.items,
    required this.title,
  });

  List<Widget> _buildChips() {
    return items
        .map((item) => ChipWidget(
              title: item.title,
              onChange: (value) => item.onChange(value),
              selected: item.selected,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.v18(
          text: title,
        ),
        Wrap(spacing: 10.0, children: _buildChips()),
      ],
    );
  }
}
