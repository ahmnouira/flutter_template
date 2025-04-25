import 'package:flutter/material.dart';
import 'package:flutter_template/src/theme/app_colors.dart';

enum SnackbarContext { error, info }

void snackBar(
  BuildContext context, {
  required String content,
  SnackbarContext snackbarContext = SnackbarContext.info,
  int milliseconds = 2000,
}) {
  final isError = snackbarContext == SnackbarContext.error;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    showCloseIcon: true,
    content: Text(
      content,
      style: TextStyle(color: isError ? Colors.white : AppColors.white),
    ),
    backgroundColor: isError ? Colors.redAccent : AppColors.primary,

    duration: Duration(milliseconds: milliseconds), // 700
  ));
}

void snackBarError(
  BuildContext context, {
  required String content,
  int milliseconds = 2000,
}) {
  snackBar(
    context,
    content: content,
    snackbarContext: SnackbarContext.error,
    milliseconds: milliseconds,
  );
}
