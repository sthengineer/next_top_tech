
import 'package:next_top_tech/core/usecase/usecase.dart';
import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:next_top_tech/src/on_boarding/domain/repositories/on_boarding_repositories.dart';

class CheckIfUserIsFirstTimer extends UseCaseWithoutParams<bool> {
  const CheckIfUserIsFirstTimer(this._repository);

  final OnBoardingRepository _repository;

  @override
  ResultFuture<bool> call() async => _repository.checkIfUserIsFirstTimer();
}
