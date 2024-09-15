import 'package:equatable/equatable.dart';
import 'package:next_top_tech/src/news_list/domain/entities/source.dart';

class Article extends Equatable {
  const Article({
    required this.source,
    required this.author,
    required this.mainSource,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Source source;
  final String? author;
  final String mainSource;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String content;

  @override
  List<Object?> get props => [
        source,
        author,
        mainSource,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
