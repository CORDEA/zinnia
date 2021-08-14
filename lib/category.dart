import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zinnia/api/response.dart';
import 'package:zinnia/category_view_model.dart';

class CategoryPage extends HookConsumerWidget {
  const CategoryPage({
    Key? key,
    required List<Source> sources,
  })  : _sources = sources,
        super(key: key);

  final List<Source> _sources;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(
      categoryViewModelProvider(_sources).select((value) => value.items),
    );
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(items[index].title),
      ),
    );
  }
}
