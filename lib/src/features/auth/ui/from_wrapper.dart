import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_hero.dart';
import 'package:flutter_template/src/ui/widgets/app_v_space.dart';

import 'title_widget.dart';

class FormWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  final Key? formState;
  const FormWrapper({
    super.key,
    required this.formState,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: ListView(children: [
        Column(children: [
          const AppHero(),
          TitleWidget(text: title),
          const AppVSpace(),
          Form(
            key: formState,
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: child,
            ),
          ),
        ]),
      ]),
    );
  }
}
