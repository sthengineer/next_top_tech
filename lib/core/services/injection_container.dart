import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:next_top_tech/core/sources/api/dio_client.dart';
import 'package:next_top_tech/core/sources/local/secure_storage.dart';
import 'package:next_top_tech/src/news_list/data/datasources/news_remote_data_source.dart';
import 'package:next_top_tech/src/news_list/data/reposotories/news_repository_implementation.dart';
import 'package:next_top_tech/src/news_list/domain/repositories/news_repository.dart';
import 'package:next_top_tech/src/news_list/domain/usecases/get_news.dart';
import 'package:next_top_tech/src/news_list/presentataion/bloc/news_list_bloc.dart';
import 'package:next_top_tech/src/on_boarding/data/datasource/on_bourding_data_source.dart';
import 'package:next_top_tech/src/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:next_top_tech/src/on_boarding/domain/repositories/on_boarding_repositories.dart';
import 'package:next_top_tech/src/on_boarding/domain/usecases/cach_first_timer.dart';
import 'package:next_top_tech/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:next_top_tech/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // App logic
    ..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        checkIfUserIsFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(() => NewsListBloc(sl()))
    // Use cases
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
    ..registerLazySingleton(() => GetNews(sl()))
    // Repositories
    ..registerLazySingleton<OnBoardingRepository>(
      () => OnBoardingRepoImpl(sl()),
    )
    ..registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImplementation(sl()),
    )
    // Data sources
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSrcImpl(sl()),
    )
    ..registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(sl()),
    )
    // External Dependencies
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(() => DioClient(dio: sl()))
    ..registerLazySingleton(FlutterSecureStorage.new)
    ..registerLazySingleton(() => SecureStorage(storage: sl()));
}
