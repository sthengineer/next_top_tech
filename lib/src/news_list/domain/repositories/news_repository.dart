import 'package:next_top_tech/core/parameters/news_query.dart';
import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article_response.dart';

abstract class NewsRepository {
  const NewsRepository();

  ResultFuture<List<ArticleResponse>> getNews({
    required List<NewsQuery> queries,
  });
}
