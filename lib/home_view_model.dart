import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider((_) => HomeViewModel());

class HomeViewModel extends ChangeNotifier {
  int _navigationIndex = 0;

  int get navigationIndex => _navigationIndex;

  void onNavigationItemTapped(int index) {
    _navigationIndex = index;
    notifyListeners();
  }
}
