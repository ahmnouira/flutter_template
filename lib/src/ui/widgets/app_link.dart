import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class LinkWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const LinkWidget({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: onPressed,
        child: AppText.v14(
          text: text,
        ),
      ),
    );
  }
}
