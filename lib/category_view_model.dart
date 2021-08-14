import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/repository/source_repository.dart';

final categoryViewModelProvider = ChangeNotifierProvider(
  (ref) => CategoryViewModel(ref.watch(sourceRepositoryProvider))..init(),
);

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel(this._sourceRepository);

  final SourceRepository _sourceRepository;

  @visibleForTesting
  Future<void> init() async {
  }
}
