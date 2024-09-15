import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:next_top_tech/src/on_boarding/domain/repositories/on_boarding_repositories.dart';
import 'package:next_top_tech/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';

import 'on_boarding_repository.mock.dart';

void main() {
  late OnBoardingRepository repo;
  late CheckIfUserIsFirstTimer usecase;
  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CheckIfUserIsFirstTimer(repo);
  });
  test(
      'should call the [OnBoardingRepository.cacheFirstTimer] '
      'and return a right data', () async {
    when(() => repo.checkIfUserIsFirstTimer()).thenAnswer(
      (_) async => const Right(true),
    );
    final result = await usecase();
    expect(result, equals(const Right<dynamic, bool>(true)));
    verify(() => repo.checkIfUserIsFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
