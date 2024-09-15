import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:next_top_tech/core/errors/exceptions.dart';
import 'package:next_top_tech/core/parameters/news_query.dart';
import 'package:next_top_tech/core/sources/api/dio_client.dart';
import 'package:next_top_tech/core/utils/constants.dart';
import 'package:next_top_tech/core/utils/typedef.dart';

import 'package:next_top_tech/src/news_list/data/models/article_response_model.dart';

abstract class NewsRemoteDataSource {
  const NewsRemoteDataSource();

  Future<List<ArticleResponseModel>> getNews({
    required List<NewsQuery> queries,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  const NewsRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<List<ArticleResponseModel>> getNews({
    required List<NewsQuery> queries,
  }) async {
    final futures = queries.map((query) {
      return Isolate.run(
        () => fetchNews(newsQuery: query),
      );
    }).toList();
    final result = await Future.wait(futures);
    return result;
  }

  Future<ArticleResponseModel> fetchNews({required NewsQuery newsQuery}) async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final from = yesterday.toIso8601String().substring(0, 10);
    final to = now.toIso8601String().substring(0, 10);
    try {
      final response = await _client.get(
        host: kBaseUrl,
        path: 'v2/everything/',
        parameters: {
          'q': newsQuery.query,
          'from': from,
          'to': to,
          'sortBy': 'publishedAt',
          'page': newsQuery.page,
          'pageSize': '2',
          'apiKey': kApiKey,
        },
      ) as Response;
      if (response.statusCode != 200) {
        throw ApiException(
          massage: response.data.toString(),
          statusCode: response.statusCode?.toString() ?? '506',
        );
      }
      final data = response.data as DataMap;
      return ArticleResponseModel.fromJson(data, newsQuery.query);
    } on ApiException {
      rethrow;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    } catch (e) {
      throw ApiException(massage: e.toString(), statusCode: '505');
    }
  }
}
