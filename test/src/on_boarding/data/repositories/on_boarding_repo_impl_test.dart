import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:next_top_tech/core/errors/exceptions.dart';
import 'package:next_top_tech/core/errors/failure.dart';
import 'package:next_top_tech/src/on_boarding/data/datasource/on_bourding_data_source.dart';
import 'package:next_top_tech/src/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:next_top_tech/src/on_boarding/domain/repositories/on_boarding_repositories.dart';

class MockOnBoardingLocalDataSrc extends Mock
    implements OnBoardingLocalDataSource {}

void main() {
  late OnBoardingLocalDataSource localDataSource;
  late OnBoardingRepoImpl repoImpl;
  setUp(() {
    localDataSource = MockOnBoardingLocalDataSrc();
    repoImpl = OnBoardingRepoImpl(localDataSource);
  });
  test('should be a subclass of [OnBoardingRepo]', () {
    expect(repoImpl, isA<OnBoardingRepository>());
  });
  group('cacheFirstTimer', () {
    test('should complete successfully when call to local source is successful',
        () async {
      when(() => localDataSource.cacheFirstTimer()).thenAnswer(
        (_) async => Future.value(),
      );
      final result = await repoImpl.cacheFirstTimer();
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => localDataSource.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
    test(
        'should return [CacheFailure] when call to local source is'
        'unsuccessful', () async {
      when(() => localDataSource.cacheFirstTimer())
          .thenThrow(const CacheException(message: 'Insufficient storage'));
      final result = await repoImpl.cacheFirstTimer();
      expect(
        result,
        Left<CacheFailure, dynamic>(
          CacheFailure(
            massage: 'Insufficient storage',
            statusCode: 500,
          ),
        ),
      );
      verify(() => localDataSource.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
  });
  group('checkIfUserIsFirstTimer', () {
    test('should complete successfully and be [bool] when call to '
        'local source is successful',
            () async {
          when(() => localDataSource.checkIfUserIsFirstTimer()).thenAnswer(
                (_) async => true,
          );
          final result = await repoImpl.checkIfUserIsFirstTimer();
          expect(result, equals(const Right<dynamic, bool>(true)));
          verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);
          verifyNoMoreInteractions(localDataSource);
        });
    test(
        'should return [CacheFailure] when call to local source is'
            'unsuccessful', () async {
      when(() => localDataSource.checkIfUserIsFirstTimer())
          .thenThrow(const CacheException(message: 'Insufficient storage'));
      final result = await repoImpl.checkIfUserIsFirstTimer();
      expect(
        result,
        Left<CacheFailure, dynamic>(
          CacheFailure(
            massage: 'Insufficient storage',
            statusCode: 500,
          ),
        ),
      );
      verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSource);
    });
  });

}
