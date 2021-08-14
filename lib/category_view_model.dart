import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/api/response.dart';

final categoryViewModelProvider =
    ChangeNotifierProvider.family<CategoryViewModel, List<Source>>(
  (ref, sources) => CategoryViewModel(sources)..init(),
);

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel(this._sources);

  final List<Source> _sources;

  List<CategoryItemViewModel> _items = [];

  List<CategoryItemViewModel> get items => _items;

  @visibleForTesting
  void init() {
    _items = _sources
        .map((e) => CategoryItemViewModel(title: e.name))
        .toList(growable: false);
    notifyListeners();
  }
}

class CategoryItemViewModel {
  CategoryItemViewModel({required this.title});

  final String title;
}
