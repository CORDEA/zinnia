import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/api/news_api_client.dart';
import 'package:zinnia/api/response.dart';

final newsRepositoryProvider =
    Provider((ref) => NewsRepository(ref.watch(newsApiClientProvider)));

class NewsRepository {
  NewsRepository(this._apiClient);

  final NewsApiClient _apiClient;

  Future<News> findAll() => _apiClient.getEverything();

  Future<News> find({required String category, required String source}) =>
      _apiClient.getTopHeadlines(category: category, source: source);
}
