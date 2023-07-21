import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_layout.dart';
import 'package:flutter_template/src/utils/screen.dart';

class AppPage<T> extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? floatingActionButton;
  final bool showAppBar;
  final bool simpleAppBar;
  final Widget? background;
  final Color? backgroundColor;
  final Widget? drawer;

  const AppPage({
    super.key,
    required this.title,
    required this.child,
    this.showAppBar = true,
    this.floatingActionButton,
    this.simpleAppBar = true,
    this.drawer,
    this.background,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: Screen.height,
        width: Screen.width,
        color: Theme.of(context).colorScheme.background,
      ),
      Scaffold(
        backgroundColor: backgroundColor,
        appBar: showAppBar
            ? simpleAppBar
                ? AppLayout.buildSimpleAppBar(context, title)
                : AppLayout.buildAppBar(title)
            : null,
        body: SafeArea(
          child: child,
        ),
        floatingActionButton: floatingActionButton,
        drawer: drawer,
      ),
    ]);
  }
}
