import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/widgets/app_result.dart';

import './app_loading.dart';

class AppFuture<T> extends StatelessWidget {
  final Future<T>? future;
  final Function(T data) builder;
  final Widget empty;
  final double padding;

  const AppFuture({
    super.key,
    required this.future,
    required this.builder,
    this.padding = 0,
    this.empty = const Text('Empty'),
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const AppResult(type: AppResultType.error);
          }
          if (!snapshot.hasData) {
            return const AppResult(type: AppResultType.empty);
          } else {
            return Container(
              padding: EdgeInsets.all(padding),
              child: builder(snapshot.data as T),
            );
          }
        } else {
          return const AppLoading();
        }
      },
    );
  }
}
