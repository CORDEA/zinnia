import 'package:flutter/material.dart';
import 'package:zinnia/api/response.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    Key? key,
    required List<Source> sources,
  })  : _sources = sources,
        super(key: key);

  final List<Source> _sources;

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
