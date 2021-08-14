import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:zinnia/api/response.dart';

final newsApiClientProvider = Provider((_) => NewsApiClient());

class NewsApiClient {
  static const _authority = 'newsapi.org';
  static const _everything = '/v2/everything';
  static const _topHeadlines = '/v2/top-headlines';
  static const _sources = '/v2/top-headlines/sources';

  Future<News> getEverything() async {
    final query = {
      'apiKey': dotenv.env['API_KEY']!,
    };
    final response = await http.get(Uri.https(_authority, _everything, query));
    return News.fromJson(jsonDecode(response.body));
  }

  Future<News> getTopHeadlines({
    required String country,
    String? category,
    String? source,
  }) async {
    final query = <String, String>{
      'apiKey': dotenv.env['API_KEY']!,
      'country': country,
      ...(source == null ? {} : {'sources': source}),
      ...(category == null ? {} : {'category': category}),
    };
    final response =
        await http.get(Uri.https(_authority, _topHeadlines, query));
    return News.fromJson(jsonDecode(response.body));
  }

  Future<Sources> getSources({
    required String country,
    String? category,
  }) async {
    final query = <String, String>{
      'apiKey': dotenv.env['API_KEY']!,
      'country': country,
      ...(category == null ? {} : {'category': category}),
    };
    final response = await http.get(Uri.https(_authority, _sources, query));
    return Sources.fromJson(jsonDecode(response.body));
  }
}
