import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:next_top_tech/src/news_list/data/models/article_model.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article_response.dart';

class ArticleResponseModel extends ArticleResponse {
  const ArticleResponseModel({
    required super.status,
    required super.totalResults,
    required super.articles,
  });

  factory ArticleResponseModel.fromJson(
    Map<String, dynamic> json,
    String mainSource,
  ) =>
      ArticleResponseModel(
        status: json['status'] as String,
        totalResults: json['totalResults'] as int,
        articles: (json['articles'] as List)
            .map((x) => ArticleModel.fromJson(x as DataMap, mainSource))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': List<dynamic>.from(
          (articles as List<ArticleModel>).map(
            (x) => x.toJson(),
          ),
        ),
      };
}
