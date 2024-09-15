import 'package:dartz/dartz.dart';
import 'package:next_top_tech/core/errors/exceptions.dart';
import 'package:next_top_tech/core/errors/failure.dart';
import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:next_top_tech/src/on_boarding/data/datasource/on_bourding_data_source.dart';
import 'package:next_top_tech/src/on_boarding/domain/repositories/on_boarding_repositories.dart';

class OnBoardingRepoImpl implements OnBoardingRepository {
  const OnBoardingRepoImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultVoid cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(massage: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final result = await _localDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(massage: e.message, statusCode: e.statusCode));
    }
  }
}
