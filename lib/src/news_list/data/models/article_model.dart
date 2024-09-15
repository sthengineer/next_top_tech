import 'package:next_top_tech/core/utils/typedef.dart';
import 'package:next_top_tech/src/news_list/data/models/source_model.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required super.source,
    required super.author,
    required super.mainSource,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(
    DataMap json,
    String mainSource,
  ) =>
      ArticleModel(
        source: SourceModel.fromJson(json['source'] as DataMap),
        mainSource: mainSource,
        author: json['author'] as String?,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: DateTime.parse(json['publishedAt'] as String),
        content: json['content'] as String,
      );

  DataMap toJson() => {
        'source': (source as SourceModel).toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt.toIso8601String(),
        'content': content,
      };
}
