import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:next_top_tech/core/utils/typedef.dart';

class ApiException extends Equatable implements Exception {
  const ApiException({
    required this.massage,
    required this.statusCode,
  });

  final String massage;
  final String statusCode;

  @override
  List<Object?> get props => [massage, statusCode];
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.message, this.statusCode = 500});

  final String message;
  final int statusCode;

  @override
  List<dynamic> get props => [message, statusCode];
}

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    final data = dioError.response?.data;
    statusCode = dioError.response?.statusCode;

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
      case DioExceptionType.badResponse:
        message = _handleError(dioError.response?.statusCode, data);
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? true) {
          message = 'No Internet';
          break;
        }
        message = 'Unexpected error occurred';
      case DioExceptionType.connectionError:
        message = 'Connection error';
      case DioExceptionType.badCertificate:
        message = 'Bad Certificate error';
    }
  }

  late String message;
  int? statusCode;

  String _handleError(int? statusCode, dynamic data) {
    try {
      final body = data as DataMap;
      final messages = (body['data'] as DataMap)['text'];
      return messages.toString();
    } catch (_, __) {}

    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
