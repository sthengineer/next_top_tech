
import 'package:next_top_tech/core/utils/typedef.dart';

abstract class ApiClient {
  Future<dynamic> get({
    required String path,
    required String host,
    data,
    DataMap? parameters,
    DataMap? headers,
  });

  Future<dynamic> post({
    required String path,
    required String host,
    data,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> put({
    required String path,
    required String host,
    data,
    DataMap? headers,
  });

  Future<dynamic> patch({
    required String path,
    required String host,
    data,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> delete({
    required String path,
    required String host,
    data,
    DataMap? headers,
  });
}
