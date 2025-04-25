import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_text.dart';

class AppBadge extends StatelessWidget {
  final void Function()? onTap;

  const AppBadge({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(alignment: Alignment.topRight, children: [
        Column(
          children: [
            Container(
              height: 7,
            ),
            const Icon(
              Icons.notifications,
              size: 32,
              color: Colors.black,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 20,
          width: 20,
          child: const Center(
            child: AppText(
              text: '3',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ]),
    );
  }
}
