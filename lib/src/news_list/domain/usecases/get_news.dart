import 'package:next_top_tech/core/parameters/news_query.dart';
import 'package:next_top_tech/core/usecase/usecase.dart';
import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article_response.dart';
import 'package:next_top_tech/src/news_list/domain/repositories/news_repository.dart';

class GetNews
    extends UseCaseWithParams<List<ArticleResponse>, List<NewsQuery>> {
  const GetNews(this._repository);

  final NewsRepository _repository;

  @override
  ResultFuture<List<ArticleResponse>> call(List<NewsQuery> params) async =>
      _repository.getNews(queries: params);
}
