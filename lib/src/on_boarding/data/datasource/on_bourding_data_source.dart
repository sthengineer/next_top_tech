
import 'package:next_top_tech/core/errors/exceptions.dart';
import 'package:next_top_tech/core/sources/local/secure_storage.dart';
import 'package:next_top_tech/core/utils/constants.dart';

abstract class OnBoardingLocalDataSource {
  const OnBoardingLocalDataSource();

  Future<void> cacheFirstTimer();

  Future<bool> checkIfUserIsFirstTimer();
}

class OnBoardingLocalDataSrcImpl extends OnBoardingLocalDataSource {
  const OnBoardingLocalDataSrcImpl(this._preferences);

  final SecureStorage _preferences;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _preferences.writeBool(key: kFirstTimerKey, value: false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async {
    try {
      return await _preferences.readBool(key: kFirstTimerKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
