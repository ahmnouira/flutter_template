import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_page.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Items',
      simpleAppBar: false,
      child: Container(),
    );
  }
}
