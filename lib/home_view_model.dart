import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider((_) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  static const _categories = {
    'Business': 'business',
    'Entertainment': 'entertainment',
    'General': 'general',
    'Health': 'health',
    'Science': 'science',
    'Sports': 'sports',
    'Technology': 'technology',
  };

  int _navigationIndex = 0;

  int get navigationIndex => _navigationIndex;

  bool get shouldShowTab => _navigationIndex == 1;

  List<String> get tabs => _categories.keys.toList(growable: false);

  void onNavigationItemTapped(int index) {
    _navigationIndex = index;
    notifyListeners();
  }
}
