import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/src/constants/api.dart';

class HttpService {
  final _dio = Dio(BaseOptions(baseUrl: Api.url));

  dynamic get({
    required String path,
    String? token,
  }) =>
      _handler(() async {
        final response = await _dio.get(
          path,
          options: token == null || token.isEmpty
              ? null
              : Options(headers: {
                  'Authorization': 'Token $token',
                }),
        );
        if (response.statusCode == HttpStatus.ok) {
          return response.data;
        } else {
          return null;
        }
      });

  dynamic post({
    required String path,
    required Object? data,
    String? token,
  }) =>
      _handler(() async {
        final response = await _dio.post(
          path,
          data: data,
          options: token == null || token.isEmpty
              ? null
              : Options(headers: {
                  'Authorization': 'Token $token',
                }),
        );

        return response.data;
      });

  dynamic put({
    required String path,
    required Object? data,
    String? token,
  }) =>
      _handler(() async {
        final response = await _dio.put(
          path,
          data: data,
          options: token == null || token.isEmpty
              ? null
              : Options(headers: {
                  'Authorization': 'Token $token',
                }),
        );

        return response.data;
      });

  Future<void> delete({
    required String path,
  }) async {
    await _dio.delete(path);
  }

  dynamic download({
    required String url,
    required String path,
    void Function(double progress)? onProgress,
    Object? data,
    String? token,
  }) =>
      _handler(() async {
        await _dio.download(
          url,
          path,
          data: data,
          onReceiveProgress: (count, total) {
            if (total != -1 && onProgress != null) {
              // The percentage of the received bytes over the total size of the file being download
              final progress = count / total * 100;

              return onProgress(progress);
            }
          },
          options: token == null || token.isEmpty
              ? null
              : Options(headers: {
                  HttpHeaders.wwwAuthenticateHeader: 'Token $token',
                  // In certain cases it might happen that the total file size is not available due
                  // to the gzip compression
                  HttpHeaders.acceptEncodingHeader: '*',
                }),
        );
      });

  dynamic _handler(Function callback) {
    try {
      return callback();
    } on DioException catch (e) {
      return {
        'error': e.response!.data,
        'status': e.response!.statusCode,
      };
    }
  }
}
