import 'dart:convert';

import 'package:flutter/services.dart';

class Utils {
  /// Load sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

  /// get the json from path
  Future<Map<String, dynamic>> getJson(
    String path, {
    bool simulate = true,
  }) async {
    if (simulate) {
      // Simulate api request wait time
      await Future.delayed(const Duration(microseconds: 1000));
    }

    // Load json from file system
    final dataString = await _loadAsset(path);

    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    return json;
  }

  /// get the json from path
  Future<String> getDataString(
    String path, {
    bool simulate = true,
  }) async {
    if (simulate) {
      // Simulate api request wait time
      await Future.delayed(const Duration(microseconds: 1000));
    }

    // Load json from file system
    return _loadAsset(path);
  }
}
