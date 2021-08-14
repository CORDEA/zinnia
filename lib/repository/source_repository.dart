import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/api/news_api_client.dart';
import 'package:zinnia/api/response.dart';

final sourceRepositoryProvider =
    Provider((ref) => SourceRepository(ref.watch(newsApiClientProvider)));

class SourceRepository {
  SourceRepository(this._apiClient);

  final NewsApiClient _apiClient;

  Future<Sources> find({required String country, String? category}) =>
      _apiClient.getSources(country: country, category: category);
}
