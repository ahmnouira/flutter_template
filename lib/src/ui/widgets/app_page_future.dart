import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_future.dart';
import 'package:flutter_template/src/ui/widgets/app_page.dart';
import 'package:flutter_template/src/ui/widgets/app_stream.dart';

class AppPageFuture<T> extends StatelessWidget {
  final String? title;
  final Future<T> future;
  final Widget Function(T data) builder;
  final Widget? floatingActionButton;
  final bool showAppBar;
  final bool simpleAppBar;
  final Widget? background;
  final Color? backgroundColor;
  final Widget? drawer;
  final bool stream;
  final Function()? onBack;

  const AppPageFuture({
    super.key,
    required this.future,
    required this.builder,
    this.title,
    this.showAppBar = true,
    this.simpleAppBar = true,
    this.floatingActionButton,
    this.drawer,
    this.background,
    this.backgroundColor,
    this.stream = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: title ?? '',
      floatingActionButton: floatingActionButton,
      showAppBar: showAppBar,
      simpleAppBar: simpleAppBar,
      background: background,
      backgroundColor: backgroundColor,
      drawer: drawer,
      onBack: onBack,
      child: stream
          ? AppStream(future: future, builder: builder)
          : AppFuture(
              future: future,
              builder: builder,
            ),
    );
  }
}
