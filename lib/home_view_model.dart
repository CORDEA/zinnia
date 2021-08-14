import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/api/response.dart';
import 'package:zinnia/repository/source_repository.dart';

final homeViewModelProvider = ChangeNotifierProvider(
  (ref) => HomeViewModel(ref.watch(sourceRepositoryProvider))..init(),
);

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._sourceRepository);

  static const _categories = {
    'Business': 'business',
    'Entertainment': 'entertainment',
    'General': 'general',
    'Health': 'health',
    'Science': 'science',
    'Sports': 'sports',
    'Technology': 'technology',
  };

  final SourceRepository _sourceRepository;

  int _navigationIndex = 0;

  int get navigationIndex => _navigationIndex;

  bool get shouldShowTab => _navigationIndex == 1;

  List<String> get tabs => _categories.keys.toList(growable: false);

  List<List<Source>> _tabSources = List.generate(_categories.length, (_) => []);

  List<List<Source>> get tabSources => _tabSources;

  @visibleForTesting
  Future<void> init() async {
    final Sources sources;
    try {
      sources = await _sourceRepository.find(country: 'us');
    } catch (e) {
      return;
    }

    final map = sources.sources.groupListsBy((e) => e.category);
    _tabSources =
        _categories.values.map((e) => map[e] ?? []).toList(growable: false);
    notifyListeners();
  }

  void onNavigationItemTapped(int index) {
    _navigationIndex = index;
    notifyListeners();
  }
}
