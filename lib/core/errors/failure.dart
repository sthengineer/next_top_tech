import 'package:equatable/equatable.dart';
import 'package:next_top_tech/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  Failure({
    required this.massage,
    required this.statusCode,
  }) : assert(
          statusCode.runtimeType == int || statusCode.runtimeType == String,
          'statusCode cannot be a ${statusCode.runtimeType}',
        );

  final String massage;
  final dynamic statusCode;

  @override
  List<Object> get props => [massage];
}

class ApiFailure extends Failure {
  ApiFailure({
    required super.massage,
    required super.statusCode,
  });

  ApiFailure.fromException(ApiException exception)
      : this(
          massage: exception.massage,
          statusCode: exception.statusCode,
        );

  ApiFailure.fromDioExceptions(DioExceptions exception)
      : this(
          massage: exception.message,
          statusCode: exception.statusCode ?? 506,
        );
}

class CacheFailure extends Failure {
  CacheFailure({
    required super.massage,
    required super.statusCode,
  });
}
