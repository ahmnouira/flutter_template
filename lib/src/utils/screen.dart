import 'dart:ui';

import 'package:flutter/material.dart';

class Screen {
  const Screen();

  /// Screen width
  static double get width => MediaQueryData.fromWindow(window).size.width;

  static double get height => MediaQueryData.fromWindow(window).size.height;
}
