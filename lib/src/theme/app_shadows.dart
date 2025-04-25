import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  final name = '';

  static final shadow14 = BoxShadow(
    color: AppColors.black.withAlpha(11),
    blurRadius: 14.5,
    offset: const Offset(0, 11),
  );

  static final shadow10 = BoxShadow(
    blurRadius: 10,
    color: Colors.black.withAlpha(1),
    offset: const Offset(0, 10),
  );
}
