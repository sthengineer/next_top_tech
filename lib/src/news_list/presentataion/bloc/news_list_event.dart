part of 'news_list_bloc.dart';

abstract class NewsListEvent extends Equatable {
  const NewsListEvent();

  @override
  List<Object?> get props => [];
}

class GetNewsEvent extends NewsListEvent {
  const GetNewsEvent({required this.newsQuery});

  final List<NewsQuery> newsQuery;

  @override
  List<Object?> get props => [newsQuery];
}
