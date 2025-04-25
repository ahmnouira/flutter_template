import 'dart:convert';

import 'package:flutter/foundation.dart';

class Logger<T> {
  T? message;

  Logger({this.message});

  static void log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

  static void json(Object data) {
    try {
      if (kDebugMode) {
        print(jsonEncode(data));
      }
    } catch (e) {
      error(e);
    }
  }

  static void map(Map<String, dynamic> data) {
    if (kDebugMode) {
      print(data);
    }
  }

  static void error(Object e) {
    if (kDebugMode) {
      print({'error': e.toString()});
    }
  }
}
