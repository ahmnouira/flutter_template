import 'package:flutter_template/src/ui/widgets/app_result.dart';
import 'package:flutter_template/src/utils/screen.dart';
import 'package:flutter/material.dart';

class AppResultEmpty extends StatelessWidget {
  final String? text;

  const AppResultEmpty({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Screen.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppResult(
              type: AppResultType.empty,
              text: text,
            ),
          ],
        ));
  }
}
