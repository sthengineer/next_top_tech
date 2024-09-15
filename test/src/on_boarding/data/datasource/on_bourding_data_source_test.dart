import 'package:flutter_test/flutter_test.dart';
import 'package:next_top_tech/core/errors/exceptions.dart';
import 'package:next_top_tech/core/sources/local/secure_storage.dart';
import 'package:next_top_tech/core/utils/constants.dart';
import 'package:next_top_tech/src/on_boarding/data/datasource/on_bourding_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late SecureStorage preferences;
  late OnBoardingLocalDataSource localDataSource;
  setUp(() {
    preferences = MockSecureStorage();
    localDataSource = OnBoardingLocalDataSrcImpl(preferences);
  });
  group('cacheFirstTimer', () {
    test('should call [SharedPreferences] to cache the data', () async {
      when(
        () => preferences.writeBool(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async => true);
      await localDataSource.cacheFirstTimer();
      verify(
        () => preferences.writeBool(key: kFirstTimerKey, value: false),
      ).called(1);
      verifyNoMoreInteractions(preferences);
    });
    test(
        'should throw a [CacheException] when there is an error caching the data',
        () async {
      when(
        () => preferences.writeBool(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenThrow(Exception());
      final methodeCall = localDataSource.cacheFirstTimer;
      expect(methodeCall, throwsA(isA<CacheException>()));
      verify(() => preferences.writeBool(key: kFirstTimerKey, value: false))
          .called(1);
      verifyNoMoreInteractions(preferences);
    });
  });
  group('checkIfUserIsFirstTimer', () {
    test(
        'should call [sharedPreferences] to check if user if the use is first '
        'timer and return right response from storage when data exist',
        () async {
      when(() => preferences.readBool(key: any(named: 'key'))).thenAnswer(
        (invocation) async => false,
      );
      final result = await localDataSource.checkIfUserIsFirstTimer();
      expect(result, false);
      verify(() => preferences.readBool(key: kFirstTimerKey)).called(1);
      verifyNoMoreInteractions(preferences);
    });
    test('should return true if there is no data in storage', () async {
      when(() => preferences.readBool(key: any(named: 'key'))).thenAnswer(
        (invocation) async => true,
      );
      final result = await localDataSource.checkIfUserIsFirstTimer();
      expect(result, true);
      verify(() => preferences.readBool(key: kFirstTimerKey)).called(1);
      verifyNoMoreInteractions(preferences);
    });
    test(
        'should throw a [CacheException] when there is an error '
        'retrieving the data', () async {
      when(() => preferences.readBool(key: any(named: 'key')))
          .thenThrow(Exception());
      final methodCall = localDataSource.checkIfUserIsFirstTimer;
      expect(methodCall, throwsA(isA<CacheException>()));
      verify(() => preferences.readBool(key: kFirstTimerKey)).called(1);
      verifyNoMoreInteractions(preferences);
    });
  });
}
