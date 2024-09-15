import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:next_top_tech/core/errors/failure.dart';
import 'package:next_top_tech/src/on_boarding/domain/repositories/on_boarding_repositories.dart';
import 'package:next_top_tech/src/on_boarding/domain/usecases/cach_first_timer.dart';

import 'on_boarding_repository.mock.dart';

void main() {
  late OnBoardingRepository repo;
  late CacheFirstTimer usecase;
  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimer(repo);
  });
  test(
      'should call the [OnBoardingRepository.cacheFirstTimer] '
      'and return a right data', () async {
    when(() => repo.cacheFirstTimer()).thenAnswer(
      (_) async => Left(
        ApiFailure(
          massage: 'Unknown error occurred',
          statusCode: 500,
        ),
      ),
    );
    final result = await usecase();
    expect(
      result,
      equals(
        Left<Failure,dynamic>(
          ApiFailure(
            massage: 'Unknown error occurred',
            statusCode: 500,
          ),
        ),
      ),
    );
    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
