import 'package:equatable/equatable.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article.dart';

class ArticleResponse extends Equatable {
  const ArticleResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  ArticleResponse.empty()
      : this(
          status: '',
          totalResults: 0,
          articles: [],
        );
  final String status;
  final int totalResults;
  final List<Article> articles;

  @override
  List<Object?> get props => [status, totalResults, articles];
}
