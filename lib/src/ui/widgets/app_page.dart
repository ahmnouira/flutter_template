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
  final void Function()? onBack;

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
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    // final user = AppAuthProvider.of(context, listen: true).user;
    final hasDrawer = drawer != null;

    AppBar? buildAppBar() {
      AppBar? appBar;
      if (showAppBar) {
        if (hasDrawer) {
          appBar = AppLayout.buildAppBarForDrawer();
        } else if (simpleAppBar) {
          appBar = AppLayout.buildSimpleAppBar(
            title,
            onPressed: onBack,
          );
        } else {
          appBar = AppLayout.buildAppBar(title);
        }
      }

      return appBar;
    }

    return Stack(children: [
      Container(
        height: Screen.height,
        width: Screen.width,
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      Scaffold(
        backgroundColor: backgroundColor,
        appBar: buildAppBar(),
        body: SafeArea(
          child: child,
        ),
        floatingActionButton: floatingActionButton,
        drawer: drawer,
      ),
    ]);
  }
}
