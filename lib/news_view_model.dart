import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/api/response.dart';
import 'package:zinnia/repository/news_repository.dart';

final newsViewModelProvider = ChangeNotifierProvider(
  (ref) => NewsViewModel(ref.watch(newsRepositoryProvider))..init(),
);

class NewsViewModel extends ChangeNotifier {
  NewsViewModel(this._newsRepository);

  final NewsRepository _newsRepository;

  List<NewsItemViewModel> _items = [];

  List<NewsItemViewModel> get items => _items;

  @visibleForTesting
  Future<void> init() async {
    final News news;
    try {
      news = await _newsRepository.find(country: 'us');
    } catch (e) {
      return;
    }
    _items = news.articles
        .map(
          (e) => NewsItemViewModel(
            title: e.title,
            content: e.content ?? '',
            url: e.url,
          ),
        )
        .toList(growable: false);
    notifyListeners();
  }
}

class NewsItemViewModel {
  NewsItemViewModel({
    required this.title,
    required this.content,
    required this.url,
  });

  final String title;
  final String content;
  final String url;
}
