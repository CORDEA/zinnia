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

  @visibleForTesting
  Future<void> init() async {
    final News news;
    try {
      news = await _newsRepository.findAll();
    } catch (e) {
      return;
    }
  }
}
