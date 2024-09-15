import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:next_top_tech/core/parameters/news_query.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article.dart';
import 'package:next_top_tech/src/news_list/domain/entities/article_response.dart';
import 'package:next_top_tech/src/news_list/domain/usecases/get_news.dart';

part 'news_list_event.dart';

part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc(GetNews getNews)
      : _getNews = getNews,
        super(NewsListInitial()) {
    on<GetNewsEvent>(gettingNews);
  }

  final GetNews _getNews;

  Future<void> gettingNews(
    GetNewsEvent event,
    Emitter<NewsListState> emit,
  ) async {
    emit(const GettingNews());

    final response = await _getNews.call(event.newsQuery);
    response.fold(
      (failure) => emit(ServiceError(massage: failure.massage)),
      (success) => emit(
        NewsLoaded(
          articleResponse: mergeListsWithIterators(success),
        ),
      ),
    );
  }

  List<Article> mergeListsWithIterators(List<ArticleResponse> lists) {
    final result = <Article>[];

    final iterators = lists.map((list) => list.articles.iterator).toList();

    var hasMore = true;
    while (hasMore) {
      hasMore = false;
      for (final it in iterators) {
        if (it.moveNext()) {
          result.add(it.current);
          hasMore = true;
        }
      }
    }

    return result;
  }
}
