import 'package:flutter/material.dart';
import 'package:eco_pat/src/theme/app_colors.dart';
import 'package:eco_pat/src/ui/widgets/app_result.dart';

import './app_loading.dart';

class AppStream<T> extends StatelessWidget {
  final Future<T> future;
  final Function(T data) builder;
  final Widget empty;
  final double padding;

  const AppStream({
    super.key,
    required this.future,
    required this.builder,
    this.padding = 0,
    this.empty = const Text('Empty'),
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.fromFuture(future),
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return AppResult(
                type: AppResultType.error, text: snapshot.error.toString());
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
          return const AppLoading(
            color: AppColors.primary,
          );
        }
      },
    );
  }
}
