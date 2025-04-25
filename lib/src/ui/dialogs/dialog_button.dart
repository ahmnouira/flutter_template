import 'package:flutter/material.dart';
import 'package:flutter_template/src/app_navigator.dart';
import 'package:flutter_template/src/ui/widgets/app_button.dart';

class DialogButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final bool secondary;
  final bool loading;
  final bool expanded;
  final double? height;

  const DialogButton({
    super.key,
    required this.text,
    this.onPressed,
    this.secondary = false,
    this.loading = false,
    this.expanded = true,
    this.height = 41,
  });

  @override
  State<DialogButton> createState() => _DialogButtonState();
}

class _DialogButtonState extends State<DialogButton> {
  void _handleSend() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    } else {
      AppNavigator.back(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final button = AppButton(
      text: widget.text,
      height: widget.height,
      loading: widget.loading,
      onPressed: _handleSend,
      secondary: widget.secondary,
    );

    return widget.expanded
        ? Expanded(
            child: button,
          )
        : button;
  }
}
