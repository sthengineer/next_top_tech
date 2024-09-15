import 'package:dartz/dartz.dart';
import 'package:next_top_tech/core/errors/exceptions.dart';
import 'package:next_top_tech/core/errors/failure.dart';
import 'package:next_top_tech/core/parameters/news_query.dart';
import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:next_top_tech/src/news_list/data/datasources/news_remote_data_source.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article_response.dart';
import 'package:next_top_tech/src/news_list/domain/repositories/news_repository.dart';

class NewsRepositoryImplementation implements NewsRepository {
  const NewsRepositoryImplementation(this._remoteDataSource);

  final NewsRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<ArticleResponse>> getNews({
    required List<NewsQuery> queries,
  }) async {
    try {
      final result = await _remoteDataSource.getNews(queries: queries);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    } on DioExceptions catch (e) {
      return Left(ApiFailure.fromDioExceptions(e));
    }
  }
}
