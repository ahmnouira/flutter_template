import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_future.dart';
import 'package:flutter_template/src/ui/widgets/app_page.dart';

class AppPageFuture<T> extends StatelessWidget {
  final String title;
  final Future<T> future;
  final Widget Function(T data) builder;
  final Widget? floatingActionButton;
  final bool showAppBar;
  final bool simpleAppBar;
  final Widget? background;
  final Color? backgroundColor;
  final Widget? drawer;

  const AppPageFuture({
    super.key,
    required this.title,
    required this.future,
    required this.builder,
    this.showAppBar = true,
    this.simpleAppBar = true,
    this.floatingActionButton,
    this.drawer,
    this.background,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: title,
      floatingActionButton: floatingActionButton,
      showAppBar: showAppBar,
      simpleAppBar: simpleAppBar,
      background: background,
      backgroundColor: backgroundColor,
      drawer: drawer,
      child: AppFuture(
        future: future,
        builder: builder,
      ),
    );
  }
}
