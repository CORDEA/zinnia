import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final newsApiClient = Provider((_) => NewsApiClient());

class NewsApiClient {
  static const _authority = 'newsapi.org';
  static const _everything = '/v2/everything';
  static const _topHeadlines = '/v2/top-headlines';
  static const _sources = '/v2/top-headlines/sources';

  Future<http.Response> getEverything() async {
    final query = {
      'apiKey': dotenv.env['API_KEY']!,
    };
    return http.get(Uri.https(_authority, _everything, query));
  }

  Future<http.Response> getTopHeadlines({
    required String category,
    required String source,
  }) async {
    final query = {
      'apiKey': dotenv.env['API_KEY']!,
      'sources': source,
      'category': category,
    };
    return http.get(Uri.https(_authority, _topHeadlines, query));
  }

  Future<http.Response> getSources({
    required String category,
  }) async {
    final query = {
      'apiKey': dotenv.env['API_KEY']!,
      'category': category,
    };
    return http.get(Uri.https(_authority, _sources, query));
  }
}
