part of 'news_list_bloc.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListInitial extends NewsListState {}

class GettingNews extends NewsListState {
  const GettingNews();
}

class NewsLoaded extends NewsListState {
  const NewsLoaded({required this.articleResponse});

  final List<Article> articleResponse;

  @override
  List<Object> get props => [articleResponse];
}

class ServiceError extends NewsListState {
  const ServiceError({required this.massage});

  final String massage;

  @override
  List<Object> get props => [massage];
}
