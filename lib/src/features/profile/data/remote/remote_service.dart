import 'package:dio/dio.dart';
import 'package:flutter_template/src/services/http_service.dart';
import 'package:flutter_template/src/utils/logger.dart';

import '../../models/user.dart';

class RemoteService {
  final _http = HttpService();

  final path = '/users';

  Future<dynamic> me({
    required String token,
  }) async {
    try {
      final data = await _http.get(
        path: '$path/me/',
        token: token,
      );

      return {
        'data': data,
        'error': null,
        'status': 200,
      };
    } on DioException catch (e) {
      final resp = {
        'data': null,
        'error': e.response!.data,
        'status': e.response!.statusCode,
      };

      Logger.map({'resp': resp});

      return resp;
    }
  }

  Future<dynamic> edit({
    required User user,
    required String token,
  }) async {
    try {
      final data = await _http.put(
        path: '$path/me/',
        token: token,
        data: user.toMap(),
      );

      return {
        'data': data,
        'error': null,
        'status': 200,
      };
    } on DioException catch (e) {
      return {
        'data': null,
        'error': e.response!.data,
        'status': e.response!.statusCode,
      };
    }
  }
}
