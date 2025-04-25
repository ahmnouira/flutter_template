import 'package:flutter/material.dart';

enum ProfileItemContext { delete, invite }

class ProfileItem {
  final String title;
  final Future<void> Function(String? value)? onClick;
  final Icon? icon;
  final ProfileItemContext? context;

  const ProfileItem(
      {required this.title,
      this.onClick = Future.value,
      this.icon,
      this.context});
}
