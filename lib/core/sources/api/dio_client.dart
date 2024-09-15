import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:next_top_tech/core/sources/api/api_client.dart';
import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:sentry_dio/sentry_dio.dart';

class DioClient implements ApiClient {

  DioClient({required this.dio}) {
    dio
      ..options.baseUrl = ''
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        LogInterceptor(
          request: false,
          requestHeader: false,
          responseHeader: false,
          requestBody: true,
          responseBody: true,
        ),
      )
      ..addSentry();
  }
  final Dio dio;

  @override
  Future<dynamic> get({
    required String path,
    required String host,
    data,
    DataMap? parameters,
    DataMap? headers,
  }) async {
    final response = await dio.get(
      Uri(
        scheme: 'https',
        host: host,
        path: path,
      ).toString(),
      data: jsonEncode(data),
      queryParameters: parameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  @override
  Future<dynamic> post({
    required String path,
    required String host,
    data,
    DataMap? headers,
  }) async {
    final response = await dio.post(
      Uri(
        scheme: 'https',
        host: host,
        path: path,
      ).toString(),
      data: jsonEncode(data),
      options: Options(
        headers: headers,
      ),
    );

    return response;
  }

  @override
  Future<dynamic> put({
    required String path,
    required String host,
    data,
    DataMap? headers,
  }) async {
    final response = await dio.put(
      Uri(
        scheme: 'https',
        host: host,
        path: path,
      ).toString(),
      data: jsonEncode(data),
      options: Options(
        headers: headers,
      ),
    );

    return response;
  }

  @override
  Future<dynamic> patch({
    required String path,
    required String host,
    data,
    DataMap? headers,
  }) async {
    final response = await dio.patch(
      Uri(
        scheme: 'https',
        host: host,
        path: path,
      ).toString(),
      data: jsonEncode(data),
      options: Options(
        headers: headers,
      ),
    );

    return response;
  }

  @override
  Future<dynamic> delete({
    required String path,
    required String host,
    data,
    DataMap? headers,
  }) async {
    final response = await dio.delete(
      Uri(
        scheme: 'https',
        host: host,
        path: path,
      ).toString(),
      data: jsonEncode(data),
      options: Options(
        headers: headers,
      ),
    );

    return response;
  }
}
