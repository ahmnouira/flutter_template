import 'package:flutter/material.dart';

enum SnackbarContext { error, info }

void snackBar(
  BuildContext context, {
  required String content,
  SnackbarContext snackbarContext = SnackbarContext.info,
  int milliseconds = 2000,
}) {
  final isError = snackbarContext == SnackbarContext.error;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      content,
      style: TextStyle(color: isError ? Colors.white : null),
    ),
    backgroundColor: isError ? Colors.redAccent : null,

    duration: Duration(milliseconds: milliseconds), // 700
  ));
}
