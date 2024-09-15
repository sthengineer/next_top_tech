
import 'package:next_top_tech/core/utils/typedef.dart';

abstract class OnBoardingRepository {
  const OnBoardingRepository();

  ResultVoid cacheFirstTimer();

  ResultFuture<bool> checkIfUserIsFirstTimer();
}
